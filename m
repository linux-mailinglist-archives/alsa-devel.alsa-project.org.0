Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F48365CCE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 18:05:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 585271686;
	Tue, 20 Apr 2021 18:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 585271686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618934747;
	bh=juOPdcqd8zqF8rSxpAjCk/7Zd87B+AekXUEWPQGRtxw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=a0cidMBbXfAYWF+33fDAbkObNRY7nJK9OAkofbaO6BoOYHEbqp5CVyXvHOMG3nXTf
	 Uw+3vbKMvIxVgh0J37kl7le6nobiylTfmn2fLTWRdsyL6vMaUjuDLQZgVflHh6ksnQ
	 WEq8JYuEu06PDJXcU317PgUPu50XLfF7/dZ4fHxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBEFF80273;
	Tue, 20 Apr 2021 18:04:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A098F80253; Tue, 20 Apr 2021 18:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic312-26.consmr.mail.ir2.yahoo.com
 (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3399DF8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 18:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3399DF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="o1KDAZGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618934645; bh=B8EeTaGpBcYPSeAl6gLhAts+BQ5GHzFschS9JyObKEE=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=o1KDAZGPzoScRH0ZjZrq1KrPrN4gllPjm2f8i5Xw77qDrld+7GEfEiqfzjelwjGpdpq4c2Gvkwun4D74luOlSH4klHw/cBMvBD6zawMG99737r1o6dTzBV22j+RGH8AuH6vLUmMFxEqdF6jOjoWHZr/ULI957VAvrxXACYW2brAFn6NlmcvWCI3EvgKrI3zX3J6zK3A7jytl/ShD8+Z49NZnBe/1K0q9ZtwCkDDg37MvuobPNnzrTIxvG9iaXyGe0+vvHg9SUmBLBVJ+eRXXS1X8Zzl4nht8YwZsJTZEfB+EBu511ZfgIXHYKhwISRH7a8cd/aP6Vk4sWiqQ5ovD4A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618934645; bh=ZrIE1n9Dld1tQVH83M/zJb4V2kP12Tg4jJv0v4l6LOu=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=L1hrCP2JSNXZCFrVAQx13cdhTxc3LlQ/kLBCnz99WpQMQEoexXgPXlBDRUo5plTDd3uCAbnCrzpTbJjPag/vSSLG9zDJAAy8zL5jkjOI7Y0jJ35HaN6G7OUR8tTLS6MkZaHXHSjcz0ibjHdX3Q5RVS2FpDl2zKMVta9yzfYtTaNXwaEQeCiB1Da8ukjoptK9DIzQIqWYWcKBUMhFhEyMoJZTOBB4PLbKmb+oVveuP5f0DtOuDyHPbUYiKi0SIriJrSaTrPidjzEr5fGceb8wsnAApbVMwox8DYOSOS03ySMkXRvnGuhG286xq1EIP4YLeieOCfWow+nt5NwjEgbcVg==
X-YMail-OSG: NkSmHNgVM1kGiSg6kzu4YPJoPtvoxSwIsF4I_qtWDun7i03p8LQeYLDOx_R1SAz
 OKqwgaNfhef1uQT2qEFE_h3E9Kjz2ZJ.yACPB2t52DujwIMz1gHxsZs1iH_nT3VYNMviPi0hsXP6
 .65OXdILbKgQ2vaemqbvO6nnv_WuQ.zduRtAfbbYalA9nl82aOPvWfTc5X3IKGlUk_bNw7TMfJj5
 UL9OnB905aMGaQ23jwYIY0.Hcy3Fr.ZepY6mAA2wuomjnTCNwkP94.wofHOqTPUNfNocAcCmC76C
 PiHD5Kh2xfd7YXASmuc7BfdtIsK88_yBOznbtfjQFQr8.KZMueOoKjDWSXTxiGc37OwLCmwAbt17
 Qznje7ufXARaO_w7LtNF3jIfjucGBiuncKIOc0Hsm0ttWnsRWlwclqTaatQhG.SOTAh.IWLPgtyp
 FpQO3EImxQ2JdjeqfdqpQXpZ22bbg.lFlNcnN40LuWWgU3H2EqtGtAvLauftGpn0aD3rTwHf4KLZ
 SHo625jXiYszaBS.o5wICPP4WTmjdUCZMtn0TpUGiHBye6vbrM93vBAgYm5DSlXgw7vvlMguyfsE
 zOUeuh7MGRICPKR0VlT2_g5ENRuBn.jvqQAEr93JRR0DiIhTzYzvLk8mnzA5g9Mp_4XojoVO74_X
 PF152beSUyp8EWAXg7hyMu73QQU5pRWdY6yQtEWBLMnzAEhrYXaPvsogoOlC2Rm5m5jpSMTXQbdK
 3RHmTIEVYeb4jQiNSxyHlG8.5E5LvN5UC.q4EqDsaZC6krbOdeiqggY5X7kMSwM58o5AhwvddYWq
 Ab_22H.rjJLCfgaFCszhe9LujuzGYyrpm92bHynotW7JVcyUbkLBi0mkMx66k4OV5z6tWt1SjAHW
 XUBUL9zH6TkgYHnu7EcvrXCVrOWmREkYSYD.TRhvvzdHBPOtprWs2RynITLEEMQdK7f_F014FlVl
 _WyWF.m_DSTTks5pt68iFTD3fTNqDo98w.aeC.bhAW.likknLUN8fZHh4xgDUUGk5EHxHwkAFwXE
 iijnjBqWtbUKZNHEoaU3PYTT3D5NcjjSbaG9XJ0WUJ8M1z9KBNbw9oUnNQQfChrQH3gKsh5WAH77
 5x4xMMNwM2TD36HQ90hjTC.mePTLuS.i_Kayhnis422iKbp_kl08mfO6yX8E5DwVvmYcQ5MEm_Na
 iHYsQkegHxdCd25hpwbd1j.2ciSdI77P1xzkhNJ_hc7DGM5NoqifQ438FB3EVToi8q9qQyrTjJ5W
 rFxytLYtVIeH.5liPH3Z7cDA5GW99hhImwUdim6pN7pIyeACIj.g_2Nn47NkLQiR5acjD6fLXwe.
 iS.EWLE_6je2ZPvngEku0wjnDoyXvswVwA2yzeoPA.WEcIFNtNEbwVfr.5.EngvXPo6ryVy_66Pv
 ZV.l6zQaUHjzmlnne85xK35sdW8ssOuP5jLuKn1EtwPfmmu2oTwO8P3cJb7soXdCteMgeLO7oNSP
 5cK1KQqQMv5rC4wa88QLqz1nITTEuxw8W0aQEyQ4WJgAqECZuniMnaaIZoaNAkc2iIG3eiywfwfo
 ouj7ZlAcrOzzgzcXXw06vf4RMQHhff2Gcu8U7VAC4mPHLBnJ2MLwo7wN9xGOVDUV27adawg5uO1X
 1d1xYFcsMa5Ofup_TP3E7X1rsiNXpl9d8tOjkuK_uf8Ds9901mPfoQun.KV0_Jz8SLCd01j7WTvK
 gXN5yzzj2X_oU2OvOQGyKJYSBOHgAjwF2D.U7trIdKyvOIKoDWHzH4gJrimcNaSqHtwBsI4tCvGi
 AHR0vrORu6NCPQWeE9PpCOmr9Nx6s7l1B_b11od5BT1.sXW09ROSL8oyUSo9TvVSGt5_31DDD_af
 M60jWrkC1HRaFJaKkhiokzWIoOooTMq1f619.XkY9D.PrW.XrcAS_DO3VlxBqVrYgHJkzca2g18l
 W7Fmnin1rPWcT5OeX2LY_06nfTOtgus1.YwHP11gqLldzCQLEFmtf0AJzo2ZfgOkjzlTLZiJyfta
 G90jNEaqVmAX_wA5wyM4dhC.LPw6E4OZdE6fotlV0VsR5SoAcht5_cmq2YaLXI_.j7ggVoUqzLo1
 U_o1_wO6Y_C0VL_xnIgZnii9dgiPN_vifN6Fu5Qbav8.CLn4TgRLLXDdqxY9YbE73ytohYJGacDd
 BuLcTqQ_lbLx34sWQ1cYu2nOFNLmsdPkvenpSs4WKKNySX_h1tdIjTaDtmj4LFWjedxZQJcAEhTi
 QQdoUyR9bK8jSTnK3ARMRElL6qhPPbqadFnVJbaodlpNMU9kvtLsjz_Dlq5tLyQz8MbYoajpJvgV
 xtr7eplZ8yk.HZT57TgkXMHxRY0KeFBTKTYjnA2bbfvgCbhGCaaNZ5u8xrl1bNrrKcdx_mllmRls
 Eo44sg4CI7UI6vcdifBDSmApH89nzcM8.ZJgUMxMd4XVyfwBYoBNiyVSk.kBBOZiCh8PPGMds3.b
 ohlhIHKx3KgqIIlr0CpmCI7GvWv3.841qYE26p3bIYd07CDqFC7HYDd8z4O_OiBsNUuGtJ9FCbKI
 MIYrvJSN9CON1yzngnr5Leq0A5scrjCmb4dSryh9ezLdhYLdybyjv6.NFIXOg2I9VlRXydSQAqMb
 lMOV6fTUH20vHXaCH_TDoZrB2I1XXnc4i.ujSYUPel8e7wDxyV1hTwT_4_Bq0B.ylHNvfmRomHRP
 yLTnxo1g9QUrGu.gYgXVOXBy7ygO8u.FM5qYUywYoIgYkLY1UI84Qs.t1xld364xHQqoXbjSd1jD
 NF1Y4ass1kCR5C_kzny8UXb.IAXbE1Rp91ok27RVK42_TYEm7XX5.vj60QrVJDjqYvyq_
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Tue, 20 Apr 2021 16:04:05 +0000
Date: Tue, 20 Apr 2021 16:04:02 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Message-ID: <425493399.6730534.1618934642983@mail.yahoo.com>
In-Reply-To: <212419469.6653726.1618928398310@mail.yahoo.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
 <212419469.6653726.1618928398310@mail.yahoo.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18121 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Reply-To: htl10@users.sourceforge.net
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 Hi,

I agree with Peter's change. Raspbian - the raspberry pi distribution - is currently shipping v5.10.x (jumping from v5.4.x in February), which has changed a lot since v5.5.x. Nonetheless, as a proof of concept, I reverted the idea of Peter's change in v.5.10.x, with this:

<diff-start>
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 91bf33958..20077dd8c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1042,7 +1042,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 case SNDRV_PCM_TRIGGER_START:
 case SNDRV_PCM_TRIGGER_RESUME:
 case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
- ret = snd_soc_link_trigger(substream, cmd);
+ ret = snd_soc_pcm_dai_trigger(substream, cmd);
 if (ret < 0)
 break;
 
@@ -1050,8 +1050,9 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 if (ret < 0)
 break;
 
- ret = snd_soc_pcm_dai_trigger(substream, cmd);
+ ret = snd_soc_link_trigger(substream, cmd);
 break;
+
 case SNDRV_PCM_TRIGGER_STOP:
 case SNDRV_PCM_TRIGGER_SUSPEND:
 case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
<diff-end>

and was able to restore the functionality of Seeed Studio's respeaker driver against v5.10.x. That it relies on the previous behavior is a bit broken. I think I'd like some dev_dbg() inside soc-pcm.c, and perhaps some help in modifying the out-of-tree audio device driver to cope?

Thanks a lot.

Regards,
Hin-Tak 

On Tuesday, 20 April 2021, 15:19:58 BST, Hin-Tak Leung <htl10@users.sourceforge.net> wrote:

> Hi Peter:

> I found the commit of a rather unusual regression between kernel v5.4 and v5.5, for an out-of-tree driver on the 
> raspberrypi. Everything looks identical between v5.4 and 5.5, within accountable differences, even with debugging in > sound/ +p and the driver side. 5.4 records fine, 5.5 stucks on recording. The commit is one of yours:

> commit 4378f1fbe924054a09ff0d4e39e1a581b9245252
> Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Date: Fri Sep 27 10:16:46 2019 +0300

> ASoC: soc-pcm: Use different sequence for start/stop trigger

...

> The problem was initially at https://github.com/respeaker/seeed-voicecard/issues/290 
> then over to https://github.com/raspberrypi/linux/issues/4279 and finally here. The "seeed-8mic-voicecard-
> overlay.dts" is the dts corresponds to the problematic device ; The one with similar hardware but okay is "seeed-
> 4mic-voicecard-overlay.dts" .

...
> The Raspberry Pi distribution raspbian jumped directly from 5.4.x to 5.10.x at the beginning of February. Considering 
> the change has been in since the v5.5 merge window, I guess I'd like some help to correct / workaround on the 
> out-of-tree driver side? And probably some new dev_err() message in the kernel for problematic driver helping to 
> diagnose similar problems in the future would be nice. 

  
