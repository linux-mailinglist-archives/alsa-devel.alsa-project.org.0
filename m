Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F088984A0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E627B2C7D;
	Thu,  4 Apr 2024 12:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E627B2C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225143;
	bh=CwEvP0862EPc/Yp83HZbeJKnDpp1Zn4yzWA5vTmp2oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NDPfsraKGq1CbgiHH1eVfl91gfPWgQQcABXoQ1YVB0PcOD64hRYdK2TfaIFO62Wej
	 mYwclg9hupIf2BlwRFejrh3KFQMvON93FA6oEhJMU/gCvb+dq85M6sp7IPSGL5yJUu
	 1pImcPvnROkoTVdiakO80PDsouq7O9iJtQfJD6GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E32FF806B6; Thu,  4 Apr 2024 12:03:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13ABCF806CA;
	Thu,  4 Apr 2024 12:03:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 492DFF805B5; Thu,  4 Apr 2024 12:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3ADBF805D9
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3ADBF805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QH3P1Kx5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224977; x=1712829777;
	i=oswald.buddenhagen@gmx.de;
	bh=y3ZFAjtMGdLBY2mwalA3DpZ7EPCNzVIgYxzw1qmK5fA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=QH3P1Kx5GIU8xXCQe3nMrQ9IdvPBkWD+aYtwuxUD7pG6ZfW8DbRE2TWcB1V5tgei
	 eRCfgFdNKaxOl+gOAynHRfsFYO3ujjTmcn2jq1OyZuo15MgTp68Nq9NCd34MgnLqn
	 kFRlZinnvsj5F0SQIRh9Dyg/qiXA8RZ9meFeirMn3G7EwVGL/R7v1L1mMKbN3GEB/
	 N07fggXOtNE1M2IJD4uSlPGEXAp5A6kInkJOXCeLY2K68l7dznFhgzGM11cOpm4gr
	 KGqmuK8MUjTmOYx1E1KHLvWW/GKNIn4pU+5U06C52Dyda4lhq6CHDDHSH0fXwAuRn
	 0MG/7LoW8s8AMXm/RA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0NU-1sYDCj0qK0-00kM9w; Thu, 04
 Apr 2024 12:02:57 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFr-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 11/17] ALSA: emu10k1: merge conditions in patch loader
Date: Thu,  4 Apr 2024 12:00:42 +0200
Message-ID: <20240404100048.819674-12-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A7iepGdEXn+ylbyHXG17tRgwaL0YIwxWITMGQyOM5f7BBE/qftC
 ZGsZqMvrfJ3nCzrVDouS+P9qeGPVM1sOEH8Xn+npKAHWaRB2hLiNBNBeO/MC2Zi4d4M2e75
 11Z7hvoN0/W1l0ugfgcHgT704p55crv34CYjtBuWQesfml1uFe515U6qKvLFp+pYZnyzv9q
 IDC9JW/tQnyE9lHWxPuZw==
UI-OutboundReport: notjunk:1;M01:P0:aLYE2Y9DXxI=;U0uP+ARq+371HU7oR6RJ67KDN8L
 1CfO1IzSUc/A48kifWlsdzzHwGbiWbK2c33rArzUqSjl+5oCHwlUwVcz2H/sKfGmURwb54oVZ
 suok+WPfpJOVCHlU7scjPqKecZk0gtpJhYKIkiFigfTmQJSsncgBuPMlmrU2sdWhi7ymv4C+I
 0A8utGvijV2Dx2K9qqb1a3n6jI9Co/9JEBOFOLkuTBStPy14vnPDoNxiY2AOXliA/Rp1XTtSS
 LLIGXOCG87XBay9U1ovSr8sfRZk9KREczYSfWepPIPy30+6bR+TepLZ/GjWmPJjwIlNXnSFgm
 vrZiXQk1DOaRRj4FBsg3djXeA3tu0mO6Gk/Cu/FkxJi1iCjJXzLCZ7ykQSyqmvxUC9+QnTYN/
 OZJy4ZW18aKaW98iRrq0jID27eEZC05o5nTNTJTScjg1k7QZHRx/LHDOxqFuVDfSPy8Yq/fsc
 9UbqsciMM8W32XaGTsYE4PsYyE3ZVtB6wtqR4p7jvONB+4U4GShoOoy5rBMyBGSihzjb/cyui
 t+RcWRUwha2b+rekNOU/1Hbz3Si+YIEYlFRlToxXdklFoS+cXSmHl0YW3u0LntFemZ0ow/5Ev
 BK3YpcFm/K1l5RNeJ1EENU+BrSEghwiwGYMtwf6zLcCGzvwwVP8vUY2v8YsRhUdd8BGMMy2nT
 Pf44QtPpxgJ0L1bYIgWXJq/OMUijMu8liKYe5yy5c9iG+/OgWOOfEtVRVi0qJzKKskojX/ST5
 1z8z8QMk/YLFMX5TMsdNKjW9vebkvKZLthl49c2bPYZ2HM8UeFfee5apGEmvCVMRNaG2+43US
 YypMBYKewnVh1g9xEyWYqokixgh/ArF+3bbyqvwiiYl5g=
Message-ID-Hash: FUIMQNLM2WNBCLMCG3D5ANKEUSD66GC3
X-Message-ID-Hash: FUIMQNLM2WNBCLMCG3D5ANKEUSD66GC3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUIMQNLM2WNBCLMCG3D5ANKEUSD66GC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This de-duplicates the code slightly. But the real reason is that it
moves the code up, which the next patch will depend on.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index eb3d1ef8a33a..281881f7d0a4 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -53,8 +53,14 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,

 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
+	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
 		truesize +=3D BLANK_LOOP_SIZE;
+		/* if no blank loop is attached in the sample, add it */
+		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
+			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
+			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
+		}
+	}

 	/* try to allocate a memory block */
 	blocksize =3D truesize;
@@ -93,14 +99,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fi=
ll);

-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
-		/* if no blank loop is attached in the sample, add it */
-		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
-			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
-			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
-		}
-	}
-
 	/* recalculate offset */
 	start_addr =3D BLANK_HEAD_SIZE * 2;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
=2D-
2.42.0.419.g70bf8a5751

