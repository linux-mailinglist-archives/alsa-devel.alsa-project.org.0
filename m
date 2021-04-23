Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA010369CAF
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C40172D;
	Sat, 24 Apr 2021 00:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C40172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619217140;
	bh=10dfyHcpS9kQPkAZYizSRrByct4CCKhMti3/m2bJ3J8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=cFOvmnDTWQU7BfRUDrzq/a40iKIHD6o61ZG4tjg9d/1xHFi3qK4k+9pexgBV3AWyG
	 x9G9MJqawwF1iE8GuybkWImWhYBpMXqdObbsvXiXzsFOvmxZK49yC3oVGBovI8Y0db
	 hV4a+KxFKoXjxbBO4Yv4o0n7y4VUHgfWerW0V1x0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD2C6F800E3;
	Sat, 24 Apr 2021 00:30:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAD3F80227; Sat, 24 Apr 2021 00:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sonic306-21.consmr.mail.ir2.yahoo.com
 (sonic306-21.consmr.mail.ir2.yahoo.com [77.238.176.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 712E0F800AE
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 00:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 712E0F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="Cc6jmUwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619217032; bh=J/7RlJZR6i9yu6TC7lR3Sph2MSZyvFOiIY50oWqgoEw=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=Cc6jmUwTx2T7b67Hmem/mnzBCn4keOykHt0/8m9LT9cmcppZ19c5fEwgMsNpiqXC1r3xOyF10mdHG7hxfvON+PG1OsCQKXaym2dZ4hEAdv19sD5LUCpwv75GIG0JpkfYBnoUFwZcocD3dh7eCsldybrE4PFHPsDxi5B+P92Cr7BIZ8mQ85c8OllSA3PP6LQ1ij3/JBorwyaO3wHd4osK30gv27O4B/p0lEF5hG9DUmSlpBKSs+zd5RtHdXODkF/Eikq7WchKBcXT8/sotNwKhAadlqZRb+rBXL7RGaDfDqlT1HyMEDnkB4KWvC1CDydCSA+rvdVrtcpHPyM7UgSplA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619217032; bh=vHsHxyjyJSel7rnk5JVRpDV8+mT0KedfT4a0kZhVsgA=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=iCiVUaPabx6szfdBzNNnErrgFWLrg40vHskT7yXVgBt+f5LNWY582DfqjJ/AiwuklIupfW8Suo2pn4rvaZhf0HP8Ym6Hjg6dwvHXFjMG5gNETSsEG9cb4Xb0lr7lwK2bXANKslW2u8qELPTIaMIdzDxD8cfKHVEjNeFqufjWsi92t0R6PA+fVAUWKoom+c6h2diO6x7dIIuaj11sReGDFGaDy6JSdCD9ZTVayQgTRkSPx9qCwrOXA5UIyy5ivaU1Pwy8dndS40p6i2wGXhMm0AOj8At6rli60bADU/epmEZnky5GgXd2v0QK5rZer+qRVxnp2gHM2KzrUFkeCiC0dA==
X-YMail-OSG: JTbmBt4VM1kiVGolN6Gw_B7x8QS_bD3apz0RdVnlMM20aBsKFV_JoDVvE36PDjf
 2jbX.gXoae8vhLlokEgMN3z75YatZYHqCMtEXqSgBbNj407bQcQ5AQuTNOG_.b_Rt9FxLmNBzxbF
 cSqRRVHXUZfkSKQQJzkNqy1IHl_L5Ks6BYBKg8ewdTbIotzG5L3k.QTiyAoAJ5WESRuBnM2PZ2z6
 zu1lfTWYW1cZ3.IbzUMX_muurHwmokXUh4uyWw_w1c515bf6kZzzHt83H.k2iZPETyMgQoaO_S1E
 6u2K2pqRCcBlP_v4JDarYsK4M2JpRxmoUhWIArMGvgELmSL0s.7l0c2W6_v5qqCQ9r23d8DFOnPc
 iyFLOE0TX6yzDdjN7dJij9rpbWF6gtN.lbS1zEVwXrneGYjMNEmEMGtF005sdGUBfTekM_k4KBHG
 8LI3dxzGa3ir2.2XoGZodJUZS0Wr2rs1cpURo9uKi6yuie96aSB0UjLf5WhAGPsyF07BuyXAxEDr
 K5toWBTApXATqbGDRL31BQqbgWEzz_gOnxfV1V.OAMDH432PnSpdS_WzJLLArrouxm1vjtz2i0_t
 avdNbMbQw6Azll6VdYjlUxAya8IMarJTjUu08L9CbqwhNHmFefNtafT32puzg_2rjD0N7K5FfGQ5
 3Jp4ED8gpOLghvgY_zl15wcEOks9oCJ3v2h_PVdV.xYQnmWUtVxRDtnXKE2iSnvA_EB_W9RfXZPh
 OEzr__eiiFR9eP1VHl_1wck4GAYVDC78pCW1b9SO4VWKMFnceHd2__RgEQXqtWZRBMtZB8UVEBtn
 9P1K.IUtE0XQAjt0DUUJ0mbF2LoHpf3P8BkhdZYMEAtu.eahlqdfBnvlEB.Tk8rBeALRuQo5bCjc
 NFBrFGQnXryULBTmMaI3OyI8ljk_gtp03FnBROn8MGlYz5O1chQXL1hofmeujmUoo5BCDEKWNb37
 VfcsHemwCXMpKNujv9nSCkMn3Lkjl_3nwSXftDlxS_CeRShFkRlR3VpFfPWafb1_YpgKolvFcHSF
 Lic1K7wuM6cYlFCM_iwIk_UYUPGjy6jWPnmAKrstPl8cKMKAAqJmVGDqcnke240kStOBc_8occ3J
 mZOmAirxy.2Jj7lhDwSZA0Y_CLwynHuns069lFH8opvvK9K_dCWBHtFuYCOxqiSTYrX.CzipiCcS
 Yrb4dZB5EIWxOU4APOywCeO3GKyJNvTUu27bsLRo87nqYCksblk1mW7cUP7TsS.GxlonMMMFKple
 ecQ2kBcH3Lw6xqErOKt70.LxevJUcVW730IJAQhzQfnrBJzeck4zcPunRtX2trZ7ZWL.erkjlWn0
 rhvAHAgxwdTpTMnrbbeLaseCjwLg.SAi3Nes.yCtMFnHyTDgZjLtTuwTY4uAD8GWaG7kkfLf3Pqu
 zNVKbHMifVLBsDpE14Qt0P7_Qs6_Gp36H09uGNbw4sumoPIgC5S9TE1WbXXXnH3I6WvZKc5RpV2P
 2BkTgKFnzcWgwjUwSpzpFoM2tDkSw5Ft3698pstqE3cSPYaRLPYaQTktkWvEnIC.Kf4AvS6kdLA9
 z7r92zzN4K31viN.gmcO7uEhr8cadwBXrNFSHwz2QuJkoMHQxTwIsD0BR9sKJrhxBqhY6a8uuEWO
 spjnluoZus12MUpUgDAI6woSZkae8f_TY9zbYNh.Q90SdJYykKvVEat2hzBuvrSssOYnOOCybyr7
 ajaqccazacr4c7Gb6xyF.TODQm1MQDj_lGMeKa9sOhTOs0m9QbjjtGgYT9lodu9zAOApTvA09qOO
 f9.1bwJap7Tf0DbpuFy_s0NO_KhHAg0fjCv3lid25xXX6X_r59LbWNIroJFzlA3dh1pACNupQK8x
 QuxSJPpbT_SAXgbw0.814mKBNvMOyPeq8vfnvnTXKFFMC2EUZ1j.TyQY.z7ZaQMeVPYOpt.TLOUG
 NYma2bqYO6uTS4CEX2zZitCNIodBe2B_z1kT1HknMzeV.2Wv9LwGNVOuf_9uRcYyonRwpnfvh8Um
 T4A7vUVIVoeHcLLDVReweOzI5UnL4f91rNjUS5GMpXhG6muIF2Vl44KQZOAvizJaa2FUEEYoxMEi
 iWEDAtX1FV756I.1cYb.ZyvZLqnOuDGC3douk_Q8A.vwzDXJbYuWgGnqoXuR0gM2ZtreQwzaIoBV
 IVaFJJbCnxY_gSsaM5bqoGLRlqw3pbubEokswJP.RtNAdSNWlJhVsesAGzp2GsV36J.r1j.PZB7V
 hBGRCMuC_0c2c0KPyf22VCtOudLwu38Kxtqun37DZj9wvI.FsZbnxjmj9SD1p2OxhUIwtL6VyB1a
 ky_lQUyoumiGr09eNufeoC.RkYzyj0IkBsQVcrhwDefuEXCHkWoo4fWNi4KyB3.914QRESqIOzO.
 4x79gIySDW_vTbp67ugI5nzDaYE2e2if0b7PoROCbey05My2v8UPEHwJezm66pyupOMU8QmpVqnQ
 MFKLAVZ7XvKyaQhjJj4Z7nMEZSo3HfrUl0oqauA160kHpix4K9tvc1Y0UpBZX6OxXCwNbmbAu.BG
 QPVXGAe3R4mU2_T4jsRD628buEqIhAsvi2MksXvMQktOEqRGqgb9tEye8CS14lcut3.Sf1Iu0PcR
 GYDZHj03d.695gAMbalkisT6i3uyxVXXWmlzwW7rSl_Abl_NGf5u9YJdB5aehsGAK74lTc.5V95W
 .ZtYd8My93oIBDdvU.0pt3TEUFRcO9RJfYpYOTljfaiAdnWyAOmMqMhhdEDR2Y6lR7R.vWarRrVa
 wHwJnbUSLaatq6urs.C30kTI9UAHZ3ZIGP8wgImidfwmM1pbQOpWtWTvIwE.cJYKuLlftx.aCZus
 7Am90dunX0eZHuFM3wGvIyw--
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Fri, 23 Apr 2021 22:30:32 +0000
Date: Fri, 23 Apr 2021 22:30:27 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <989629357.29063.1619217027895@mail.yahoo.com>
In-Reply-To: <1556414365.8666901.1619176930979@mail.yahoo.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
 <212419469.6653726.1618928398310@mail.yahoo.com>
 <425493399.6730534.1618934642983@mail.yahoo.com>
 <ec99afd0-fa6b-71a5-653d-f1ef9687d5ed@gmail.com>
 <1556414365.8666901.1619176930979@mail.yahoo.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18138 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

=20

On Friday, 23 April 2021, 12:22:11 BST, Hin-Tak Leung <htl10@users.sourcefo=
rge.net> wrote:

> On Thursday, 22 April 2021, 15:01:02 BST, P=C3=A9ter Ujfalusi <peter.ujfa=
lusi@gmail.com> wrote:

> > Can you point me to the out of tree driver and the related dts files?
> > Can it be reproduced with rpbi w/o any hat? I have one hifiberry but
> > that is playback only and if I'm not mistaken the 3.5 on the board also=
?

> For your purpose you can see my fork (which includes v5.4 -> v5.10 migrat=
ion change, unlike the vendor's),=20
> https://github.com/HinTak/seeed-voicecard .=20

> The dts concerned is: https://github.com/HinTak/seeed-voicecard/blob/v5.9=
/seeed-8mic-voicecard-overlay.dts

> The card trigger code is in: https://github.com/HinTak/seeed-voicecard/bl=
ob/v5.9/seeed-voicecard.c

> while the codec trigger code is in
> https://github.com/HinTak/seeed-voicecard/blob/v5.9/ac108.c
> and also https://github.com/HinTak/seeed-voicecard/blob/v5.9/ac101.c !=20

> Note that the routine ac101_trigger() is not used, although the ac101 cod=
ec itself is involved.
> There is a spinlock in ac108_trigger(), which I have long suspected to be=
 incorrect, and has been known to cause the > pi to kernel panic if built w=
ith PREEMPT ; Now I think it is there to make it work under the previous wr=
ong sequence.

> There is another device of the same family - which records okay regardles=
s of the trigger sequence=20
> https://github.com/HinTak/seeed-voicecard/blob/v5.9/seeed-4mic-voicecard-=
overlay.dts .

> The problematic device has 8 mics, using two ac108 for 2 x 4-ADC and the =
ac101 for DAC loopback (and as clock
> master?). The 4-mics record-okay device has just one ac108 (and without a=
 ac101) to record 4-channels.

I have gone ahead and inserted a number of pr_info()'s to all the triggers =
(and compare the order of calls in 5.4 and 5.10) ; there was a mistake in m=
y comment above: ac101_trigger() is used! it is just not set up as a call-b=
ack in the component struct.

If I understand it correctly, the 8-mics device was designed to do record a=
nd playback simultaneously; the master clock is really on the DAC ac101 cod=
ec; and ac101_trigger() needed to be called before the card trigger code se=
eed_voice_card_trigger() calling _set_clock().

In 5.4, we had ac108_trigger() calling ac101_trigger() , then seeed_voice_c=
ard_trigger() calling _set_clock(), which works.=20
in 5.10 (and 5.5+), seeed_voice_card_trigger() calling _set_clock(), then a=
c108_trigger() calling ac101_trigger() , which does not.

So I made this rather ugly change to the driver code, and it gives me the r=
ight behavior:

<diff-begin>
diff --git a/Makefile b/Makefile
index b9de7f4..1aa0949 100644
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,7 @@ ifneq ($(KERNELRELEASE),)
=20
 snd-soc-wm8960-objs :=3D wm8960.o
 snd-soc-ac108-objs :=3D ac108.o ac101.o
-snd-soc-seeed-voicecard-objs :=3D seeed-voicecard.o
+snd-soc-seeed-voicecard-objs :=3D seeed-voicecard.o ac101.o
=20
=20
 obj-m +=3D snd-soc-wm8960.o
diff --git a/ac108.c b/ac108.c
index 5fe5176..c755741 100644
--- a/ac108.c
+++ b/ac108.c
@@ -1060,7 +1060,7 @@ static int ac108_trigger(struct snd_pcm_substream *su=
bstream, int cmd,
=20
 spin_lock_irqsave(&ac10x->lock, flags);
=20
- if (ac10x->i2c101 && _MASTER_MULTI_CODEC =3D=3D _MASTER_AC101) {
+ if (!cmd && ac10x->i2c101 && _MASTER_MULTI_CODEC =3D=3D _MASTER_AC101) {
 ac101_trigger(substream, cmd, dai);
 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
 goto __ret;
diff --git a/seeed-voicecard.c b/seeed-voicecard.c
index 23dfb15..244dc6e 100644
--- a/seeed-voicecard.c
+++ b/seeed-voicecard.c
@@ -197,6 +197,7 @@ static int seeed_voice_card_trigger(struct snd_pcm_subs=
tream *substream, int cmd
 {
 struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
 struct snd_soc_dai *dai =3D asoc_rtd_to_codec(rtd, 0);
+ struct ac10x_priv *ac10x =3D snd_soc_dai_get_drvdata(dai);
 struct seeed_card_data *priv =3D snd_soc_card_get_drvdata(rtd->card);
 #if CONFIG_AC10X_TRIG_LOCK
 unsigned long flags;
@@ -216,6 +217,9 @@ static int seeed_voice_card_trigger(struct snd_pcm_subs=
tream *substream, int cmd
 /* I know it will degrades performance, but I have no choice */
 spin_lock_irqsave(&priv->lock, flags);
 #endif
+ if (cmd && ac10x->i2c101 && _MASTER_MULTI_CODEC =3D=3D _MASTER_AC101) {
+ ac101_trigger(substream, cmd, dai);
+ }
 if (_set_clock[SNDRV_PCM_STREAM_CAPTURE]) _set_clock[SNDRV_PCM_STREAM_CAPT=
URE](1);
 if (_set_clock[SNDRV_PCM_STREAM_PLAYBACK]) _set_clock[SNDRV_PCM_STREAM_PLA=
YBACK](1);
 #if CONFIG_AC10X_TRIG_LOCK
<diff-ends>

It is certainly not ideal for the card driver to be linked directly and cal=
ling codec routines... Is there a better way of doing this, perhaps by re-w=
riting the dts in https://github.com/HinTak/seeed-voicecard/blob/v5.9/seeed=
-8mic-voicecard-overlay.dts ?=20

While we are at it, the spinlock in ac108.c (just above the changed line) s=
eems wrong; can somebody have a look and advise on what better way to do it=
?

Regards,
Hin-Tak =20
