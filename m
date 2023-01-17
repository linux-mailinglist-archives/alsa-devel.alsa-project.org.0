Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6019266E493
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 18:13:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B0306B17;
	Tue, 17 Jan 2023 18:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B0306B17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673975626;
	bh=T1YX+7v++iT+p9UCqcNeNXf8qzxAO8KXpTdkm/5Wh/4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=l3bo0K4we3LKBcmJU/b8eF4596VUrsvCChumX9dWnETI0sOMG7H2ZIHclH75ooc8Q
	 C7I6rQ7D0v9qm577kuirWr6xljSNItOkKcYR7K3GJTzDAwToMJ+h10GBDRPyodBuOn
	 IkCO1z/6Bl1thtqivOB/odRVE5DiNg9soilFNpXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B47F804EC;
	Tue, 17 Jan 2023 18:12:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4839F8047B; Tue, 17 Jan 2023 12:15:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34575F8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34575F8022D
Received: by air.basealt.ru (Postfix, from userid 490)
 id 8FCFE2F20230; Tue, 17 Jan 2023 11:15:25 +0000 (UTC)
Received: from localhost (broadband-188-32-10-232.ip.moscow.rt.ru
 [188.32.10.232])
 by air.basealt.ru (Postfix) with ESMTPSA id 1D6B82F2022C;
 Tue, 17 Jan 2023 11:15:23 +0000 (UTC)
Date: Tue, 17 Jan 2023 14:15:23 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: hda/ca0132: minor fix for allocation size
Message-ID: <20230117111522.GA15213@altlinux.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 17 Jan 2023 18:12:39 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, lvc-project@linuxtesting.org,
 Ian Minett <ian_minett@creativelabs.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Takashi Iwai <tiwai@suse.com>, Xian Wang <dev@xianwang.io>,
 "Alexey V. Vissarionov" <gremlin@altlinux.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Although the "dma_chan" pointer occupies more or equal space compared
to "*dma_chan", the allocation size should use the size of variable
itself.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 01ef7dbffb411d9d ("ALSA: hda - Update CA0132 codec to load DSP firmw=
are binary")
Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 0a292bf271f2e59a..acde4cd58785e0cb 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -2455,7 +2455,7 @@ static int dspio_set_uint_param(struct hda_codec *cod=
ec, int mod_id,
 static int dspio_alloc_dma_chan(struct hda_codec *codec, unsigned int *dma=
_chan)
 {
 	int status =3D 0;
-	unsigned int size =3D sizeof(dma_chan);
+	unsigned int size =3D sizeof(*dma_chan);
=20
 	codec_dbg(codec, "     dspio_alloc_dma_chan() -- begin\n");
 	status =3D dspio_scp(codec, MASTERCONTROL, 0x20,


--=20
Alexey V. Vissarionov
gremlin =F0=F2=E9 altlinux =F4=FE=EB org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJjxoNKAAoJEFv2F9znRj5KU2IP/A9EgJ/2sPrwFgPnInPTBDO/
yL/DCmz1u/2iRUaeFo3lv6NCRzBWrvTT9UFa88VOntuGWS0rp4n6eRGVur907V12
vkvK34rWUhxGW5FqATgwB04XjzwWBc2234ycOL6qQHDFEJJICt8YbjY08KMt/Xe+
TTAMwNsfw9WvsSgAVuWwBkMztMXcTgbLkwBoZ9S3DUsOT4AiAKeCBXBZBb24NOjR
a59fW2HAZZQr0zGONML7cGm7yzlfHrBrs/4kOI3461binaNaBaZD48XQRQ6pbZuZ
GXAfsjCP04pyDy50BMBBUqJyhefZ3Ls0/6RP+UQSppECZO8vXwsQNGZL4j7os6rm
kk5f3rejaW+wKbItHqJ28T8zuhmrNyzDFmmr8mx/2p5v9sDM2VFlzBSQXWZtAHK+
N6BTkwQvYYomL2KY4yzfBcMmU9C+04WvV24n9iBUkjT2rZA4Ezctspq4V09gwWLa
29BdZO6zOPixfwdnkmKfl8QhemNREPmuEUkdOB2nPQLivIOmm1Ea7XOlU6kh160z
nlRSAXOZaouGa0rouQvlaFDWXXLKrHOIjxSezm3tVzahpnffJosckg5WNLLiuJyK
L3fKtu72ly9GbbDxXRCXYJ51OyNpvsS+52XTaQ53S4AEWOKS8DnIw9lGkf+tDVWd
j7YCGNWdxBxSyDXfWlmQ
=IATM
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
