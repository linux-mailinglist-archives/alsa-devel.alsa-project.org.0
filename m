Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B11F8DCF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99B431615;
	Mon, 15 Jun 2020 08:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99B431615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202473;
	bh=hODACSUY88YfWy/1ue1K6NbgGY66s732EiZXFu8/scY=;
	h=Date:From:To:Subject:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fjO31wDSvTkjjBVLy1TpW+DrdW17TwaBwAhKi4PMn+KUUwrXigCsX+RpeP++dulIN
	 4Ov9wsFQXw+gsayTdepPx/30dy5tqEJdoZ01JV+2s+RCgmBcKZ3JZbtHOIM3h2p6Xq
	 m9kV6Uypk4VeXsGGeoblwq2scWkdWXBOA1ShVbcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A84F800CD;
	Mon, 15 Jun 2020 08:26:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3BC3F80279; Sat, 13 Jun 2020 13:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic314-46.consmr.mail.sg3.yahoo.com
 (sonic314-46.consmr.mail.sg3.yahoo.com [106.10.240.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 514B4F800CD
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 13:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 514B4F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com.hk header.i=@yahoo.com.hk
 header.b="jyZaClIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.hk; s=s2048;
 t=1592048539; bh=hODACSUY88YfWy/1ue1K6NbgGY66s732EiZXFu8/scY=;
 h=Date:From:To:Subject:References:From:Subject;
 b=jyZaClIO7pqmV7Ib24c7UhoeHtoHPO36JyQmoJQvXJAvEb3TXUpN7UD86TKOcAn8gBpJV7Vf9BAvGLSdWAGcBDI/QpqT4tlYsrBI6cZtSUconDgmZRW2AGhQxoM/a2TDrgj4kQjlWC+XfxQHM/2Tx34t2KxfnxJfh0PRBItr8S6HDnOZ5Cw6bzZoyfIEr28J9TvoqHa5G1Ly2q7GCK/gqWsU9Zaqf6F0mFYciTItdeGc8Q10pxEVA8Fr2BCflNu2EWQmCA+nMArm1IFNxxQoP6xjnogfXogscZ5cA/wST11tMgfNuQXG5xitAy6DEBUH1jf0cDbFiwlB0qOPH9Im0g==
X-YMail-OSG: y157DicVM1lSOyizKnATXJu930x0LTcwn.GYjk2vtTaC02ULnrUA18nmnUk9ois
 hWQF3MRsdhd.SN.QSZx.JTbUGJE5fxLNs6nTRAzbC2SZDRzdMWuctD9vD1R0KyEglKEGh1K7nDnH
 SL3b2dd2Ox1tHuhqUxxmw5eWZSeTmqE82mA9xFGK81OiT8IA_yXd1qxpRNWGhDk5HY0pjhrEHcBb
 wt7W_XorbZSryJgaLcCWTxalgD5NIueQSZ9cbxJt3lj6kUJEQmiGz5j6wheCkk2yIYH9L_GbpM6Y
 PSYbQenOopR.nv_jizuAYttCtqLHXeFHyGiRnnz9PyA7veEQ5JDNOAccAhbZ4TSIur7PQol.kopa
 jObH0vJuXAKU.zJwLWmvBQEAS3ck7mnfoiO4zNELS6tMiExsf21beDqMU0vTZMjgEyiib1l_S9DW
 .FuRfxJYtGMWsUOVb.DQ8RB34BthCmcm7km2U4FZnpwnuprvaLDznp2CyDDEDGHW6oBDjmVIb1lo
 j44tBuo5GtpmfojZjBdtfkkll_LcDo9giN3K71wnC3r.JGmZR4QY5Prbm3JgPppWaYuGtoxaq9uu
 akM1dJmECzDRdEcR7.JZgCFnqjIQSAUxbTYm.XvbkTl25VozY1UPD4kfrVgvYDY8qomZyCFYVv8I
 Dwrgggwg_xTCGqvSAn9UvY7Klx1.R3WnX7usASlplnjjDXTbR8wgrYPB7N5DW5YtexUM.kIo7_Tq
 2sWL7Iqq7Qrvb8OKlgzN5u3b0Flz2wYdjjYs88QJKnIaFWU.4doZNGK1X8TIP7NDuRqOT_fv2Pxw
 J9xF0cBPpb0kA1rVsZoGfOOH9JH8SzlqmdeWcCW7suLiXlb81Fw4c95mKZiIx.GMMFb0x2I4fs9V
 qC1qBFwKle3C59ALmt4CC_FoJQWooQU6S7PZ81Jc_Kvk9ohERXC4EXGb1wprXukLRbiMA1G.mOFy
 VmV37V9RWUhiEHCKtBldQwQAFmkeNCWmTnjo1ZC6tXe7BVSAIqsK1VgDFsP3RSrJmnix38i4d2L2
 b2sEFfOwjy2vwzXOIfxjBcHZ5ENB7X3tj3G67AtwDTpA.znn1Ex1tT8_Sp7OBuhLv7BIWBn7U0Uy
 5mghi58uJbT64cQPKzLP_V1DnfEpNtoFr.vETEr0aB6nQoyFF_x84ffpSrDTMQJoPvC9PW9JIv3J
 TRLKD.Dc8QqtI2igQXC4COruc4Va19VJFOZabPeDHhoueEwgqTHo2s43p271WRChBQav0R3K2kYP
 8FSY0rDvYRRaJCutfWx_2XJVxpykuN0XewwwE78Ii1V4AO8s1e00.0ytFEKOHko1n2zieZuw9uDB
 bem9d23CYDuJsMyw9TNjHtV3ANInpEjoV4vsz0oSEtRqttq9YEuTQ.0_Oyw_kcNF6pAQH
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.sg3.yahoo.com with HTTP; Sat, 13 Jun 2020 11:42:19 +0000
Date: Sat, 13 Jun 2020 11:40:06 +0000 (UTC)
From: "Yick W. Tse" <y_w_tse@yahoo.com.hk>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, 
 "alexander@tsoy.me" <alexander@tsoy.me>, 
 "jussi@sonarnerd.net" <jussi@sonarnerd.net>, 
 "mickflemm@gmail.com" <mickflemm@gmail.com>, 
 "dmitry@d-systems.ee" <dmitry@d-systems.ee>, 
 "crwulff@gmail.com" <crwulff@gmail.com>, 
 "jesus-ramos@live.com" <jesus-ramos@live.com>, 
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <1373857985.210365.1592048406997@mail.yahoo.com>
Subject: [PATCH] ALSA: usb-audio: add quirk for Denon DCD-1500RE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1373857985.210365.1592048406997.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16119 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/83.0.4103.97 Safari/537.36
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:10 +0200
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

fix error "clock source 41 is not valid, cannot use"


[] New USB device found, idVendor=3D154e, idProduct=3D1002, bcdDevice=3D 1.=
00
[] New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
[] Product: DCD-1500RE
[] Manufacturer: D & M Holdings Inc.
[]
[] clock source 41 is not valid, cannot use
[] usbcore: registered new interface driver snd-usb-audio


Signed-off-by: Yick W. Tse <y_w_tse@yahoo.com.hk>
---
=C2=A0sound/usb/quirks.c | 1 +
=C2=A01 file changed, 1 insertion(+)


diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index bca0179a0ef8..c495e720e2f1 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1532,6 +1532,7 @@ bool snd_usb_get_sample_rate_quirk(struct snd_usb_aud=
io *chip)
=C2=A0static bool is_itf_usb_dsd_dac(unsigned int id)
=C2=A0{
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (id) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case USB_ID(0x154e, 0x1002): /* Denon DCD-1500R=
E */
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case USB_ID(0x154e, 0x1003): /* Denon DA-300USB=
 */
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case USB_ID(0x154e, 0x3005): /* Marantz HD-DAC1=
 */
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case USB_ID(0x154e, 0x3006): /* Marantz SA-14S1=
 */
--

