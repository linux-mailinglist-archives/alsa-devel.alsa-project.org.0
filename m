Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCB864479C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 16:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 280B21741;
	Tue,  6 Dec 2022 16:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 280B21741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670339340;
	bh=vbNLnP7/re/Ow5iv7l3uOs46lA73kfK1Y2eH0t8Nfl0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBQAFAtX24vTbbPpvfaTv86AsU2AfrVgMryanEybrBjV0ahOK2YUkiz/ekPP/bxU8
	 DDo/Vjmh2r8XkSwMcePzMtW/QP0BgACTxNtVNtZgfg2RHr1caPnq5e8I+Lo65yPy4z
	 vpErw1zYOW/69w9dWAqj7cOsRM92KsjsXX4z1XKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED08F80290;
	Tue,  6 Dec 2022 16:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF033F80155; Tue,  6 Dec 2022 16:08:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62EDEF8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 16:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62EDEF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Gh3Laqv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670339276; x=1701875276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vbNLnP7/re/Ow5iv7l3uOs46lA73kfK1Y2eH0t8Nfl0=;
 b=Gh3Laqv9eqVtLM1apCpJHzwqN42+mXbegj1M5pP++J94ryrnVI1xOoPX
 Cltf07kJUKXpSSUoHGfzXHOL9DyEXPAZcp211ou+fwiEyimdbzLuHfwGv
 HatmEDxILCU9zSHPPFhQIHMZd6p+1zR9zi8G8gZMsvLD3f1I0EZEZ2/kE
 Hi0NXU41JEAMZHBVrEXkhqLCeP1UjbINZOt/VppDNkq0rR06PNbFhUIeu
 jmUpRbI0dMB+HNqM8PbJRQA68ywETimMQU8EIJYoa4d/MjHlSVyVANx+r
 kWEg8gAfjxr5ClQKNewyrD/QrOaVdeG2iPwAwYC2Dl0JTIiHI6eCjoZcu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="318501047"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="318501047"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 07:07:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="891409743"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="891409743"
Received: from cjian12x-mobl.amr.corp.intel.com (HELO [10.212.125.207])
 ([10.212.125.207])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 07:07:24 -0800
Message-ID: <d6da4f2f-d6d8-bab6-66f0-a4b2486d1922@linux.intel.com>
Date: Tue, 6 Dec 2022 09:07:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ALSA: compress: Add AC3, EAC3, TrueHD, DTS, MPEG-H 3D
 Audio Stream (MHAS)
Content-Language: en-US
To: Carlos Rafael Giani <crg7475@mailbox.org>, Vinod Koul <vkoul@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20221206145317.99934-1-crg7475@mailbox.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221206145317.99934-1-crg7475@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 12/6/22 08:53, Carlos Rafael Giani wrote:
> These audio codecs are used in sound bars and digital TVs, and benefit
> from off-loading to a DSP. In particular, Dolby Atmos and MPEG-H 3D audio
> spatialization is done in dedicated DSPs. Thus, adding these codecs  to
> the Compress-Offload API makes sense.

The question is "how is the stream transported". In most implementations
for these formats, the DSP is on the receiver side and the transport
happens with an IEC61937 format - which does not require the use of the
compressed API.

> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  include/uapi/sound/compress_params.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index ddc77322d571..7a58e2026be3 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -43,7 +43,13 @@
>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> +#define SND_AUDIOCODEC_AC3                   ((__u32) 0x00000011)
> +#define SND_AUDIOCODEC_EAC3                  ((__u32) 0x00000012)
> +#define SND_AUDIOCODEC_TRUEHD                ((__u32) 0x00000013)
> +#define SND_AUDIOCODEC_DTS                   ((__u32) 0x00000014)

IIRC there are multiple flavors of DTS, off the top of my head DTS-ES,
96, HD, Master Audio. "DTS" only doesn't even begin to describe the
possible variants.

> +/* MPEG-H 3D Audio Stream (MHAS) as defined in ISO/IEC 23008-3 */
> +#define SND_AUDIOCODEC_MHAS                  ((__u32) 0x00000015)

Doesn't this need the definition of profiles and various types of
formats - classic problem with designed-by-committee MPEG codecs.

> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_MHAS


>  /*
>   * Profile and modes are listed with bit masks. This allows for a
