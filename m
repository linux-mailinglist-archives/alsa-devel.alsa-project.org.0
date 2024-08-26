Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531BF96098D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 14:05:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08C5DF9;
	Tue, 27 Aug 2024 14:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08C5DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724760353;
	bh=Qn3M3vmRZzraCJP1PyOXHTgq9SDzr8WdswahhXJn/J4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FQkTJhmfuVjRwRE84FLdHsYY6xyAFfm4IhSDXAngR9pwRd81L7YocUSo9nGelehce
	 eYOK8S8ihT1iIztLv+9JecpX7+sKP5fJEdfrv730isBXSGR8YFwf6z+6cjgVwOVidU
	 1yrgqIg6fS1WHF6piDEWHNb7Uw2KDebo0MI6fypc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CC5F805F8; Tue, 27 Aug 2024 14:04:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C478F805F4;
	Tue, 27 Aug 2024 14:04:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74A73F80423; Mon, 26 Aug 2024 22:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp42.i.mail.ru (smtp42.i.mail.ru [95.163.41.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5898DF800AC
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 22:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5898DF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.a=rsa-sha256
 header.s=mailru header.b=SKdlV1of
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
	:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=ilmNAnKKxEeweg3uWm2brVCV7sOH91NkrbsL8Az54xs=; t=1724702976; x=1724792976;
	b=SKdlV1ofu4Zv2snK4F6u9WDH1IVk0zDKWhDk8Vdc0YPmlxHj/IiPxh9amM1PpT9lVjsznWogfG3
	HJqcsNAVNnjbyEfnQhtdk+L7NEcyGcalfmiRPpzWRWumf25JhwUlj2NHmZFzW4bsA5lFCMPVJv6wK
	GR7WAt0uHS6KK3njbL0=;
Received: by smtp42.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sig1u-0000000DUOL-29qg; Mon, 26 Aug 2024 23:09:35 +0300
Message-ID: <d31553a0-b132-4766-ac9a-482c9741279d@jiaxyga.com>
Date: Mon, 26 Aug 2024 23:09:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ASoC: qcom: sm8250: enable primary mi2s
To: Jens Reidel <adrian@travitia.xyz>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, danila@jiaxyga.com
References: <20240826134920.55148-1-adrian@travitia.xyz>
 <20240826134920.55148-2-adrian@travitia.xyz>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <20240826134920.55148-2-adrian@travitia.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp42.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9B598A67DFB323527D48FFF5EF22321F878691CF7956759E8182A05F538085040C4F1C46E9BE3493DAC8EDD30083ED68E52CAA46F094D7EF06387C59B9F8F67A3CC29A3283896A6B0
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE743A67C3F703598BFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D24CDE3D695BBBC6EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36FC7603D7D7DA14629B0EB3E6C23E510AC614157694A2C2EAA471835C12D1D9774AD6D5ED66289B5259CC434672EE6371117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE70C93C844AB25B962D32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED6299176DF2183F8FC7C0FD819E82F1CB4899CD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C088D2E8BEBF93D4B068655334FD4449CB33AC447995A7AD18262FEC7FBD7D1F5BD5E8D9A59859A8B6F82A78844E5C6993089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 
 0D63561A33F958A5E9988FBB8A8C66425002B1117B3ED69627A8CAB2A2024D76466072E6821086B3823CB91A9FED034534781492E4B8EEAD8D8BB953E4894305BDAD6C7F3747799A
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF5F1E4C4F712246222B7216557DFBFA7D0D8DF8E3C4E7E7803E8075B400D3F03506ED036F265C5428CBD875B35315F9A8B23EECF961B6CB091A3EDCF40A9E60E2F85287069806F0C42BF32D1DA1046D202C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/M7/1rzOD9un0x4JxBuqlg==
X-Mailru-Sender: 
 9EB879F2C80682A09F26F806C7394981FA4D19B1A53E9A3AA7CF1FCFAF80C0E94883779FF0B09D57E7C767D26902A0D02C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-MailFrom: danila@jiaxyga.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WO3AYF5FVWMPCKKJ72PU2HJGQ4MC5GQG
X-Message-ID-Hash: WO3AYF5FVWMPCKKJ72PU2HJGQ4MC5GQG
X-Mailman-Approved-At: Tue, 27 Aug 2024 12:04:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WO3AYF5FVWMPCKKJ72PU2HJGQ4MC5GQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/26/24 16:49, Jens Reidel wrote:
> When using primary mi2s on sm8250-compatible SoCs, the correct clock
> needs to get enabled to be able to use the mi2s interface.
>
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>   sound/soc/qcom/sm8250.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index a15dafb99b33..274bab28209a 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -55,6 +55,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>   	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>   
>   	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>   	case TERTIARY_MI2S_RX:
>   		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>   		snd_soc_dai_set_sysclk(cpu_dai,
Thank you. I use sm8250-sndcard on sm7325 and it works for me:
https://github.com/mainlining/linux/commit/292a1ac9f093c639363f257e92d313489ec5a394

Let the maintainers decide whether it is really fair to add this tag.

Tested-by: Danila Tikhonov <danila@jiaxyga.com> # sm7325-nothing-spacewar

---
Best wishes,
Danila
