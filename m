Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A72748485
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 15:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAEC9741;
	Wed,  5 Jul 2023 14:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAEC9741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688562030;
	bh=xbgcZ3m7PW1EPs1zd/RQT2E8lvFeY36cUEa4G9xvrA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cl/9iLRJsTa8pX0HGShslKs1pKWHOuhEXxE060zQxBPkVxlNBnpbkWUyLU/qXSEQE
	 oEAOjgEyz1BUKKXpoQ1eP4YPEl5MfIhgISZKMj1S5AteYLq4epMVjK7ER3OR5Nwy3q
	 3MiJMTAz6Yr4aZGWZiL25riWXWXMRMSe2Hv77uwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DF63F80544; Wed,  5 Jul 2023 14:59:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 927B1F80124;
	Wed,  5 Jul 2023 14:59:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0159DF80125; Wed,  5 Jul 2023 14:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66919F80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66919F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S86aXfv4
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7948c329363so1856022241.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688561966; x=1691153966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nZHZeidSk3mCWY3MjBsM3AN+Ta4vT4cFL5EZs5XXzbA=;
        b=S86aXfv4RuDoIWVp59Jmuk4JfLil/DCbyfDqj8/GmjshKavfTxAkuCmRZNKUQw68yD
         kY0iMDgr0MVe5CeJkY64waSv9VKM+RK5zFn49VYhjlyRiXCvN0jzXSEt+WiFKqtsFOTb
         rMoefcX0b/FEJsefg1+zrs0spKxAqz5EKTwrtP80pTmasaZDlsPBuiRwttd2R3u10zuO
         irNO54E7JbHWg/ln18doalqOVbsSUdkQ9iNgq53jI1qRN7RNG5apyciNJbFbwSmIgeHg
         zcEkoQTDdynOIrX1ru9Ef03d6Xqm4gAzHuHcVBAfOYutCMTxnppqQI759+0DBxV6eMP9
         4xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688561966; x=1691153966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZHZeidSk3mCWY3MjBsM3AN+Ta4vT4cFL5EZs5XXzbA=;
        b=YBkgkX/jPsOOjeQglX2QltaE7iNOY/F25JftzCg9QMjUFVJ/VVLiKrVI+BXo2afEbH
         ZSg+gdii0CdYg+a5qfahMpgt+v8KivG7lntMEmMuVWhl5uYfDi8af4/g/xL3cxu2mgKi
         DiPSKuS5xXrxro+q2ho32Go9vpBsFx9gwjpNafpOQf07FNSE2lYs8ewRTJQwcGoOfZk5
         wWAjWwB/tEDCwh6wQQ6doSYjSZrMuqJTl6lSPoxfUEF+4VOvQbgYc1zYXsnviIYsW/JM
         Bg5TLy3+HKseXr+z6St6rzdj0OJa70iLT65TIMZ2u1YG1Cp7WG9qcYXFhazQ8o8zdQqZ
         0SlA==
X-Gm-Message-State: ABy/qLbkh9YgWYK2Y8ew+9KA2OFzmTY71qSRNvRHP6oXXYYCPZIYJGNV
	Z6MqRpkzgtwONboPs40JwxYQA6r8otb1fnIEWnnq1g==
X-Google-Smtp-Source: 
 APBJJlF2cytqWVzR5MRGWFqYl0PN+/hU8lNQBqczzpcm9IC1mTIREpURJudjlLv3fff1c8uiVHFuMc4y6+sQnYI97Q0=
X-Received: by 2002:a67:f041:0:b0:443:6c53:e26b with SMTP id
 q1-20020a67f041000000b004436c53e26bmr6325396vsm.10.1688561965702; Wed, 05 Jul
 2023 05:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230705124850.40069-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20230705124850.40069-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 5 Jul 2023 18:28:49 +0530
Message-ID: 
 <CAMi1Hd28mRKJqpCSNxvixA+H=5cyVWHyTQ8w2He5qBE_nbpu+g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: q6afe-dai: fix Display Port Playback stream
 name
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: Q2MMVKNUGFQTYQM2PNDMGXUZSV3QDYTN
X-Message-ID-Hash: Q2MMVKNUGFQTYQM2PNDMGXUZSV3QDYTN
X-MailFrom: amit.pundir@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2MMVKNUGFQTYQM2PNDMGXUZSV3QDYTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 5 Jul 2023 at 18:18, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> With recent changes to add more display ports did not change the Stream
> name in q6afe-dai. This results in below error
> "ASoC: Failed to add route DISPLAY_PORT_RX -> Display Port Playback(*)"
> and sound card fails to probe.
>
> Fix this by adding correct stream name.

Tested-by: Amit Pundir <amit.pundir@linaro.org> # tested on Dragonboard 845c

>
> Fixes: 90848a2557fe ("ASoC: qcom: q6dsp: add support to more display ports")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index 31e0bad71e95..dbff55a97162 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -476,7 +476,7 @@ static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
>
>  static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
>         {"HDMI Playback", NULL, "HDMI_RX"},
> -       {"Display Port Playback", NULL, "DISPLAY_PORT_RX"},
> +       {"DISPLAY_PORT_RX_0 Playback", NULL, "DISPLAY_PORT_RX"},
>         {"Slimbus Playback", NULL, "SLIMBUS_0_RX"},
>         {"Slimbus1 Playback", NULL, "SLIMBUS_1_RX"},
>         {"Slimbus2 Playback", NULL, "SLIMBUS_2_RX"},
> --
> 2.25.1
>
