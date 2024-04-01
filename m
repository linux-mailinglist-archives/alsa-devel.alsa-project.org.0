Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E488893C6E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 16:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50FF22366;
	Mon,  1 Apr 2024 16:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50FF22366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711983536;
	bh=1/lj47ubau9B00MPE/XwFVc2LbzwpQgE/WpGquXOMdw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FZFlRs1oA1fID1UKliIpX0LFK9YfPG9K4EVO8fWe+UqtybCWXPsBnpux0PeNtPVbp
	 xT6zPoV5GGOy1mf6N+UazXgCdFcDybpNG+wWUv3ZzoVJbd/HSsslmIrdHxbAcoKZMr
	 /XH9MT3LA+lzINZEfP81noJW6B3nJ1J7GrZIsnC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98A20F805AB; Mon,  1 Apr 2024 16:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42293F8057D;
	Mon,  1 Apr 2024 16:58:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23E35F80236; Mon,  1 Apr 2024 16:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44C67F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 16:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C67F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HKj/9rLN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711983489; x=1712588289;
	i=oswald.buddenhagen@gmx.de;
	bh=dho26Ue/YruMpBHf4LBm24jda4a/x89Gu0ST0fzBG1s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=HKj/9rLN+IwkTtNwAzSkwpMPHPNM8KrmAtG3RjiBVYM1c02xgTwT7cfpDfs0DBMS
	 c6HNY7OmyM76eDGDqixSDL8Up+p633eiw26SY51N+sGGLi4ZduZHxwVxTEp8zLYv0
	 EnKAN693+TnszleDD67aL4XhM43XWCXER2R1PHkCOti/nBmw98rROEs0DczclnGzu
	 2I+reP3gvG31DsW42TDtnEGH8wpxXXgJ6KnNymm6o7u/Bxy8PY7dAoZ+YGs1lpkUR
	 xAnac8R2KXBhVo091MQSqvoPJ8zIDzG9/tPlrmtJrUx80ECPOuPP4USVKXFRkRMG/
	 LUZAXqosEBO9YJsw+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1spcx81QVA-0134fN; Mon, 01
 Apr 2024 16:58:09 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrJ6r-DZ5-00; Mon, 01 Apr 2024 16:58:05 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH] Revert "ALSA: emu10k1: fix synthesizer sample playback
 position and caching"
Date: Mon,  1 Apr 2024 16:58:05 +0200
Message-ID: <20240401145805.528794-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KJ0WQspFoF/iryD36a7E+DUEStQ8c5EJ5hPRLoL4aaFEveFCzHX
 d1nE0J14I0w71NkAFDsXVfyIi2ajmcvQ6yNVrqfEk5ngujaodB4a8LbkPP/Ar3epxK1fXOM
 3mfrAkwKVCyYv281kup9HpBtv5zaeoX4LlCziQbx6XG/HdMkabRfOFZm/Ize23XMwc30b9s
 3lwS4ZLGVPPyEpjtms3Hg==
UI-OutboundReport: notjunk:1;M01:P0:BqY8q5dNXXw=;s2pcfKvuMXXExq+6jo1FtRQfnhB
 T+GESpDzKhp2jE/zgg1gbyooqq/hQVrX+onfmdM1vPZtm0AADZkmrh26N9bcNxbtDL4zsbbZM
 RcjqjBoAgQDAM1V8d6HGlKg+numNZJwc8R/9VDLHhgWoV1Oh1vAsZxLiKKCweY/pW7bwFr4VQ
 z3ZeCiu9xmOsye3ZfbZCStY9bNSsNTAdEeqgndAHdl44qCd2idAIu/IoI1vYdDrMMYKXx4iYS
 pZ+MggxbLeQ75Lb4WtRkGRNLIuI7OM8nnT/09FFtzoUTi28V7U7g0u6G/mGRtfIIUwTmpLKIL
 +L/rM+jf09RAGtXuAJhFhqjsK8m0X0UmstveGtNh05YuVNtn1gPFnNIp9auml3j0ZSxzLS3sh
 AWjkF2mgPU2IawwF9aTKLEqxE80RfHlrh0SYpEN5ePYpCjRc8BbIE3ImLp4iF2l+WBtmc0XUE
 jII4A5f06GQ1td+5tdD69ax13HQTauEEF18izBSqJ4VXou0Do7FqpH01Imha5lcPOC0mnouA2
 aJEqBRrikZM6yUZdEzUnoHJY8H2+3ogJVAP4EZwvoPjrtaHgxDG6rLrV87o8RCNHt+7wYDF+w
 3QqsSsZ7Pmx5RtDUrx2aVs+OL7gSbP1phycbJqAUthyvR10V4J2ABHMNehFmctlDLoKE3/QoM
 UEuey2z3E5CvclVbj7WzTLIwNs6rBN+hynwyBEVvEZ75XaoP8EsQibf8uanKPikgAvBCv/m4z
 2Av5xNS5IeAyo55agj4uQLm0RvXqqNP6yGIcmfGdTQ2iV9A0j2VpnzFD8rhQtaxgODekXt3+u
 cfjnvoejn3PW2Ty0gnhZU9bJNuwcOUPj1JQ4J9eMxTJzI=
Message-ID-Hash: 3AWS4TLNCIYTKCPVPXTFYAVM4V2RM237
X-Message-ID-Hash: 3AWS4TLNCIYTKCPVPXTFYAVM4V2RM237
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AWS4TLNCIYTKCPVPXTFYAVM4V2RM237/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As already anticipated in the original commit, playback was broken for
very short samples. I just didn't expect it to be an actual problem,
because we're talking about less than 1.5 milliseconds here. But clearly
such wavetable samples do actually exist.

The problem was that for such short samples we'd set the current
position beyond the end of the loop, so we'd run off the end of the
sample and play garbage.
This is a bigger (more audible) problem than the original one, which was
that we'd start playback with garbage (whatever was still in the cache),
which would be mostly masked by the note's attack phase.

So revert to the old behavior for now. We'll subsequently fix it
properly with a bigger patch series.
Note that this isn't a full revert - the dead code is not re-introduced,
because that would be silly.

Fixes: df335e9a8b (ALSA: emu10k1: fix synthesizer sample playback position=
 and caching, 2023-05-18)
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218625
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_callback.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu1=
0k1_callback.c
index d36234b88fb4..941bfbf812ed 100644
=2D-- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -255,7 +255,7 @@ lookup_voices(struct snd_emux *emu, struct snd_emu10k1=
 *hw,
 		/* check if sample is finished playing (non-looping only) */
 		if (bp !=3D best + V_OFF && bp !=3D best + V_FREE &&
 		    (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_SINGLESHOT)) {
-			val =3D snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch) - 64;
+			val =3D snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch);
 			if (val >=3D vp->reg.loopstart)
 				bp =3D best + V_OFF;
 		}
@@ -362,7 +362,7 @@ start_voice(struct snd_emux_voice *vp)

 	map =3D (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ?=
 MAP_PTI_MASK1 : MAP_PTI_MASK0);

-	addr =3D vp->reg.start + 64;
+	addr =3D vp->reg.start;
 	temp =3D vp->reg.parm.filterQ;
 	ccca =3D (temp << 28) | addr;
 	if (vp->apitch < 0xe400)
@@ -430,9 +430,6 @@ start_voice(struct snd_emux_voice *vp)
 		/* Q & current address (Q 4bit value, MSB) */
 		CCCA, ccca,

-		/* cache */
-		CCR, REG_VAL_PUT(CCR_CACHEINVALIDSIZE, 64),
-
 		/* reset volume */
 		VTFT, vtarget | vp->ftarget,
 		CVCF, vtarget | CVCF_CURRENTFILTER_MASK,
=2D-
2.42.0.419.g70bf8a5751

