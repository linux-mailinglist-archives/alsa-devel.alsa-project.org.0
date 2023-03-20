Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F156C21B2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809A51E7;
	Mon, 20 Mar 2023 20:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809A51E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679341205;
	bh=avSQ0k9BN3m+A1vXVeXkaRyQW1fuVFs9LpvB5NFFYoA=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=JSeDRQZMZOehvuTMu/q+euA4xxv0lwXAp0nl6swzZ64EukA7uRtZYaOWYMMd+anj2
	 4Hs+e4UipvkY2IasJorvj9KrOhId0sT3wfKQK0bXvizD3HW2FBi+T9Zy7Y0OtLrWAp
	 fEWU3LDoUDXpVpnpV+JzfqQIK7R+WYpUGtstuEaU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD36F80105;
	Mon, 20 Mar 2023 20:39:14 +0100 (CET)
Date: Mon, 20 Mar 2023 14:38:59 -0500
Subject: Re: [PATCH] ASoC: cs35l41: Add 12288000 clk freq to cs35l41_fs_mon
 clk config
To: Jianhua Lu <lujianhua000@gmail.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Lucas
 Tanure" <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
References: <20230318141440.29023-1-lujianhua000@gmail.com>
In-Reply-To: <20230318141440.29023-1-lujianhua000@gmail.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZNTNMPUSHD4ZYUZB7KJS57ESMTIO65C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167934115444.26.10457467526627099986@mailman-core.alsa-project.org>
From: "Rhodes, David via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: "Rhodes, David" <drhodes@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF8D4F8027B; Mon, 20 Mar 2023 20:39:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75D1BF80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 20:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D1BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XcQmTVII
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KGAEfg013625;
	Mon, 20 Mar 2023 14:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=EritH9eyjTdyxmH/0UuaFU8x2mTPKhBy6eIsn4jnwF4=;
 b=XcQmTVIIMgcwGEoZAJlndIWEObjaocSmP2SmeEHvDYA1PlTewb5R8fqE4Ma7LviGVoDQ
 FxfDWgTA49xduLFbdyhBfv26drv40Dr+N61ATzXrlSps7okRftvCSgwxqYSmHKsjzx/E
 ev9cQSVowgbhRdul26QRO42l+eGppsJosB6PTzLoWZlQLFF4lyUUL/IxXzDJwxR0qPjV
 MlkmbwuDH+TUFIqypqdrwq0L7RYw7ceOYkvKs59FX8gg1+93FNqoCZhIPe7OZC+YnIyd
 4lTIPAiALqVLD55L9nYRe82Fzrk+Uz0OTvExv4AvQHk0Pqqp9Z0T2WqX7JrBAakc287b eQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pd9qpu483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 14:39:04 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 20 Mar
 2023 14:39:03 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Mon, 20 Mar 2023 14:39:03 -0500
Received: from [141.131.78.120] (AUSNF2SWST2.ad.cirrus.com [141.131.78.120])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B9930468;
	Mon, 20 Mar 2023 19:39:00 +0000 (UTC)
Message-ID: <0cea5741-96f2-4691-07bb-a7c12363eb01@opensource.cirrus.com>
Date: Mon, 20 Mar 2023 14:38:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: cs35l41: Add 12288000 clk freq to cs35l41_fs_mon
 clk config
To: Jianhua Lu <lujianhua000@gmail.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Lucas
 Tanure" <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
References: <20230318141440.29023-1-lujianhua000@gmail.com>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20230318141440.29023-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YoL4D-TRZStMW_T4ORoPc-KRIF0myGAe
X-Proofpoint-ORIG-GUID: YoL4D-TRZStMW_T4ORoPc-KRIF0myGAe
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SZNTNMPUSHD4ZYUZB7KJS57ESMTIO65C
X-Message-ID-Hash: SZNTNMPUSHD4ZYUZB7KJS57ESMTIO65C
X-MailFrom: prvs=844348e71b=drhodes@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZNTNMPUSHD4ZYUZB7KJS57ESMTIO65C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/18/23 9:14 AM, Jianhua Lu wrote:
> There are 8 cs35l41 speaker amplifier connected to TDM
> in my Xiaomi Mi Pad 5 Pro tablet. In this case, it's necessary
> to set 12288000 (48000 * 32 * 8) clk freq for it.
> 
> rate=48000, slot_width=32, slots=8.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>   sound/soc/codecs/cs35l41.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
> index 9ec01a5f09ca..6ac501f008ec 100644
> --- a/sound/soc/codecs/cs35l41.c
> +++ b/sound/soc/codecs/cs35l41.c
> @@ -150,6 +150,7 @@ static const struct cs35l41_fs_mon_config cs35l41_fs_mon[] = {
>   	{ 5644800,	16,	24 },
>   	{ 6000000,	16,	24 },
>   	{ 6144000,	16,	24 },
> +	{ 12288000,	0,	0 },
>   };
>   
>   static int cs35l41_get_fs_mon_config_index(int freq)

This is a valid clocking configuration. 12.288 MHz is already available 
in cs35l41_pll_sysclk[] as well.
Values for fs1 and fs2 are not required because cs35l41_dai_set_sysclk() 
will use hardcoded values for freq > 6.144 MHz.

Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>

Thanks,
David
