Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65A9DFC22
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:41:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C976C1923;
	Mon,  2 Dec 2024 09:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C976C1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128865;
	bh=3tlwou2ly1FSVPGI+kNPRidhI8VWMpU7ojWbBT+mgvI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xv9txlwPThHiAKnPEfLJCKrOp3Ik0uAXhPeTbH9hl7EXs0I89HhwTKMJsaERf/JWu
	 bcO77MHH2s55CF86Ppt38JKhSFrCNEdkt/EheKL+enfledFFPsGWHmTQtGDEMC23rB
	 bmoUmQbz+OuIWr5PYkGaA2NfTZ/JedTGjvJJ35SM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFF9FF805C4; Mon,  2 Dec 2024 09:40:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6B6F805AE;
	Mon,  2 Dec 2024 09:40:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C53F80134; Fri, 22 Nov 2024 10:48:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 907D8F80134
	for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2024 10:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 907D8F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=spasswolf@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=dbh0B0Yv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732268895; x=1732873695; i=spasswolf@web.de;
	bh=jgsWbzEaeodrT/HG+ixsgaG/8789Y4nHnVAiPfUysPM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dbh0B0Yveobj5uPw/ZYncFJgBjfQkpW4MShbnoYpx7xgLsvpZ0DHyOg1nPwqvVo0
	 BYfhu/6yegoO53zxJriveXgqbE4HCw60xeeb+knXwz2ypqnCrMS72D6me1SAecPYF
	 iLOH2POP/QYqRmgSWacTqsRPii0NTWe+EwYSp48LbwzYaCS8ErSWCAOAuNhJXaOWC
	 vw7UkuXf+Cucd8+MB2UAl3lr3lQfE5bGBj6jTVg4vuagdLpL8imBp2pEyU0ClDfGk
	 79dJwXewIXUEF+f1+N4AsOUa9HAIxPZ4WzxEtysWJQ35/K8aeEg81HsrcChDYKsTK
	 HWMM5Ep6XKW1bZ+G8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOV6-1t3tSf265S-00I5uB; Fri, 22
 Nov 2024 10:48:15 +0100
Message-ID: <8b18aea7c30b16f3a79036e25579f1d26ef2b1cb.camel@web.de>
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
From: Bert Karwatzki <spasswolf@web.de>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, spasswolf@web.de
Date: Fri, 22 Nov 2024 10:48:14 +0100
In-Reply-To: <Zz8_kZkKyetqnRr2@linaro.org>
References: <20241117232100.23760-1-spasswolf@web.de>
	 <Zz8_kZkKyetqnRr2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iYAU8b2NyM15m6ed7nUARIN284sYmhrR0u/UbEdF4yJoWePOYZU
 2BSzVQX/fVK7XElwA35LiCzDlZhFhLYzORU2g79EIRE8Djz/r9NpqKkeqrsvRZkRP7EGMqk
 xcMp5nNPsWG2kUpc3SNdsVRtY2OTLyMk6Y18WIHg6ziBT7i3gX+CWSyt0CLs6/Ejj24dg70
 3HlbAHkmzvJ98zoDORe2Q==
UI-OutboundReport: notjunk:1;M01:P0:RzwKDYuTiT0=;lHrpLhF3BwGKawv2Rbk+QVEakf4
 Xa+aqcZ8EswcEPRfTaU+smSK1f5wUIqR8BRWTozgLhXwBjMUXGwoWg7XJJ6HffwVaGkeOB2kd
 jJMwzv72+NFcVv5VvpsUjrdTY1K5tYPsVtFtfgy9ylvEGj0fF4HF2M+ZO51ct852XSngs4Aol
 YqPlRbzacPpnqPfM5p8/xAaKYeANpUY4/hLrlYeyhSNISutLQbLk5dajH0nYEBcHptbIko9Wh
 NgyhWo2dTMSSmrL7RraWInUd7JbCcCIqBXV2lsK4kMjPShkI2vCOqWli8LokWogewsvKa+OuQ
 RKQbc9SfAL3o1j1Ha7PdV5fvVJCUlgUFU/AmokOrX7pbWahs2RTTugtoLvheKTv4eIBaPPSFh
 /dPwNJedjJGSHitxfAOs3lPOGSbtms4QL+hzuThSI8e0ly2s0eJx5sbXSaLOwK7j5J+VIq0Xb
 71PdJzs06YrFcbBRELTMisjNyrv5r6EnSa4GmXo8D1pLawgVZLWElofhgV8sfBSDCA7XfnGY0
 GscrMBgz2upjcc1D9BUiupyzHWIknZ+3+Ci2vCzpIpeH7kRLQG5Tn8Nu6s43F8XcwxTeXYQ3t
 qPnYb4Quws9d9Q5LQ/n75QWqqV1HqGjHJczG/MuX8ZO+TM6DtOlzmIvn7rJqTBS2fxquZxnSI
 zIYR/YBuk866opx7yJbXLgQUdt8a8OPBARen0npkqi/IZA7JeG1yiFFXHi8E2VuijEG9+Y9Ce
 XEI3DuvYzie5DWNF6AXwjjsJku+s+crCE6gKesu5uckTw6nybBtLMWmhWxdO/dEqtP9ujT3W0
 u8NHa1Cg20ty65c+gfXNFyViGHzodlugjD+N4RK3du3NU8lo+z/Wjir9ZLr8aezf8jAmYsEtG
 LvlAvZvS/+tQ+scYd/AzPSt4LaiW9EGi5/bJfjC/puFIvygNBejhLIVIsJTvK/1zp7X8mjd6E
 ZTixa3b+RxTjEDmnY8cI/53W4l0mEvkRX+ZsVhTcZjWcRSQmNhnGqLVj9fEdmmUJGEq5dP+J/
 vtqFejzzDHGTBhIuiW/TEe1FkkCwLsaCeyDkBP+nSCOYyLQTSkBwxV1syHloYU3XJxEMVODfy
 +cA8dZdg8=
X-MailFrom: spasswolf@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FCMD7VCXX33QWS3ETISGMDGTDJWMRAMT
X-Message-ID-Hash: FCMD7VCXX33QWS3ETISGMDGTDJWMRAMT
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:40:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCMD7VCXX33QWS3ETISGMDGTDJWMRAMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Donnerstag, dem 21.11.2024 um 15:11 +0100 schrieb Stephan Gerhold:
> Hi,
>
> On Mon, Nov 18, 2024 at 12:20:58AM +0100, Bert Karwatzki wrote:
> > Since commit a78a42fb48b8 the second argument of apq8016_dai_init() ha=
s
> > to be an lpass id returned by qdsp6_dai_get_lpass_id().
> >
> > Fixes: a78a42fb48b8 ("ASoC: qcom: apq8016_sbc: Allow routing audio thr=
ough QDSP6")
> >
> > Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> > ---
> >  sound/soc/qcom/apq8016_sbc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc=
.c
> > index 3023cf180a75..ddfcd4616895 100644
> > --- a/sound/soc/qcom/apq8016_sbc.c
> > +++ b/sound/soc/qcom/apq8016_sbc.c
> > @@ -150,7 +150,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm=
_runtime *rtd)
> >  {
> >  	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> >
> > -	return apq8016_dai_init(rtd, cpu_dai->id);
> > +	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
> >  }
> >
>
> Hm no, the code is correct the way it is. There are two cases handled by
> this driver:
>
>  - ADSP bypass (lpass-* drivers, qcom,apq8016-sbc-sndcard): This one
>    uses the LPASS IDs as DAI IDs, so cpu_dai->id already contains the
>    correct value.
>
>  - ADSP (qdsp6 drivers, qcom,msm8916-qdsp6-sndcard): This one uses the
>    QDSP6 IDs (e.g. PRIMARY_MI2S_RX/TX instead of MI2S_PRIMARY), so
>    qdsp6_dai_get_lpass_id() is used to translate that to the LPASS IDs.
>
> The code you are changing here handles the first case (ADSP bypass),
> the DAI IDs do not need any translation there.
>
> Thanks,
> Stephan

Thank you for explaining this, and sorry for causing trouble with my "fix"=
.

Bert Karwatzki

