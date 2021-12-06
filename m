Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24787468E59
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 01:38:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D3E1FCC;
	Mon,  6 Dec 2021 01:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D3E1FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638751080;
	bh=zrHoYzHH+TTXGNAsgVDjlojYb9bC2uBsquG8/TXcLC0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfokaZpoJ8VlXmAPvWPHu89jGw4NyvzczOQB8RV6rQYUlepBT20B5dPBOo0FwN06Z
	 E/3AGA2tw3ZdYw4/hyjLvcKJx7quuE9vzY6YaNdD1mx7zP+OacY5bqM7VXHrLWbVp0
	 I1wOs8ot3+cpY8dS8SkK7BF4f3pK7v7DCb3Cr0Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD56F80259;
	Mon,  6 Dec 2021 01:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 759BEF80253; Mon,  6 Dec 2021 01:36:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08660F800D3;
 Mon,  6 Dec 2021 01:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08660F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Ds8sh2OB"
Received: from [192.168.0.108] (unknown [123.112.66.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B9B4841BCE; 
 Mon,  6 Dec 2021 00:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638750988;
 bh=+JERJC850BGNubSbxA1O3CGXSSEWr0IXlQLLn70HOqI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=Ds8sh2OB0yLnHcMSRMWRwEutKzvLBuNI1xMiZZt01sbDA6pobr8Ao1tEXWLcb9f+y
 UOPiaUVfmX1rRxdemLj+apV2hHWuicsqjOsmtXDNwQcsGCSxk9eCGj6KW6OLIl0lpX
 7XNZZt15ZDaVRCd8jbLxElxcFbcuLvHNywGTvaD9iGG7snbfnJICDTrhwWes2nPwM2
 2wv2Vlgn2mMeCj5gKR7XVFOGvkXHMogEhpaaZ3QEgCOLzN434cQC2Gy2C9OoY9btRf
 7rTFVqTqQWxlq+WHjyKsFdvTasuUGrSg9n1HMhGiKfhPEPU3sri4By/oZRqc40MuGr
 cHQDbRq+WTeBQ==
Subject: Re: [PATCH] ASoC: SOF: Intel: move CODEC_PROBE_RETRIES definition
To: Arnd Bergmann <arnd@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
References: <20211204174529.1122697-1-arnd@kernel.org>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <4a1427ac-bae3-f339-828e-1f9a0229803c@canonical.com>
Date: Mon, 6 Dec 2021 08:36:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211204174529.1122697-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bard Liao <bard.liao@intel.com>, sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Arnd, and Kai Vehmanen already sent a fix for this building 
failure: 
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-December/193313.html

On 12/5/21 1:44 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The macro is defined in an #ifdef but used outside:
>
> sound/soc/sof/intel/hda-codec.c: In function 'hda_codec_probe':
> sound/soc/sof/intel/hda-codec.c:132:42: error: 'CODEC_PROBE_RETRIES' undeclared (first use in this function)
>    132 |         } while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
>        |                                          ^~~~~~~~~~~~~~~~~~~
>
> Move it to a place where it can be seen unconditionally.
>
> Fixes: 046aede2f847 ("ASoC: SOF: Intel: Retry codec probing if it fails")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/sof/intel/hda-codec.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> index 13cd96e6724a..4324178b3ca6 100644
> --- a/sound/soc/sof/intel/hda-codec.c
> +++ b/sound/soc/sof/intel/hda-codec.c
> @@ -20,9 +20,10 @@
>   #include "../../codecs/hdac_hda.h"
>   #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
>   
> +#define CODEC_PROBE_RETRIES 3
> +
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>   #define IDISP_VID_INTEL	0x80860000
> -#define CODEC_PROBE_RETRIES 3
>   
>   /* load the legacy HDA codec driver */
>   static int request_codec_module(struct hda_codec *codec)
