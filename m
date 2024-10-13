Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E099C4BB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D1DE76;
	Mon, 14 Oct 2024 11:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D1DE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728896834;
	bh=dEOkx1uGWtJcAGrsGjcgVVAnfYzZ1FJ1gsLf+68kC5E=;
	h=Date:From:To:Subject:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RC0EsibLBNULoGv3ZlDr6c/5nWY0aLhy//2xAyWzrLzx5gg3vS0L8bRRzDDr4twny
	 Zh4a6cSokzKGv3YXSv3MmEXuDuW8o5aMxBKHkyAWEypRWWO0yJnMwyzw8HJHgII/lA
	 nyBdNRkAo6Pwmgazcl9aOr1IamKG8k9Cw4aItWaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36723F8060B; Mon, 14 Oct 2024 11:06:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7A9F805F7;
	Mon, 14 Oct 2024 11:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 657A6F80448; Sun, 13 Oct 2024 23:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sonic320-21.consmr.mail.ne1.yahoo.com
 (sonic320-21.consmr.mail.ne1.yahoo.com [66.163.191.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5554EF8016B
	for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2024 23:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5554EF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=D7tPH1MN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728854654; bh=EOoMB6yVnzHisvYdUpnLrVE5szP/Mr4E5txkuAozufo=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=D7tPH1MNTPV6Q5jZaUo/MDXUS9cE3SAWofFfYo4870gh9zk0T0lHcqrnREpM2LuxAZDOUYeCe0Nb/IJb7tYnS5XNUxmTz0ApVrb0Gvvc5J9hoYuxWlK8CrpWjSbXMTNX0r3vlcJkPkJ/xXdoR2u98oHzu3eC5YIO93EGcK7PRafHlQloBBTj5Pk744XcefoIcu7lGbwNAl6DFRC0cHJILnujG0Fjy4oOGMST8geFSNdG75uPH6dHWDMdQTC5Kvao7mxDTs5xoDFtsZBTTBXtHB3BiBurp7fNqZzfehqX9XVHviyGUMH2o2Ohm79aW6bDJ04kvAPgr9hBT53PovHzwA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728854654; bh=lKsGjUiaZ7wvWKdgza+Pl88+i/KysFj95VlVHNd3xht=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=LjvIFTufyyG9NdyBf3fFIiRsmppJ1A8fD66cW4fha4wtBjELy3EL+juirSO3Hu2rHj0GejkjShV3SkyPF/gQgPYMvCf/CNM8tkABVPM1KvO/4Y3kC2B5Fg8QKdOVy7Q3RrXOmPzq86Wnk5xTFuijxONocZ1GBFOhwZ1HrhOoMm9V6vU6hoact/xtiVMPayaOk6s71G2CJ08HylGerM3ZyEuA6QLPOlf8qecU6syTMt3pf9OPX1MhmJboeDQf+4s3MUyh4AAbUE6237zO6OWwHnVOLWAGampTk7E4keV6kJWptAe8Js0bGSJc/JCaYyU8oBns2LCwlg9+0laii5Z51A==
X-YMail-OSG: sSVuhB4VM1noIT2t0ZA8rP7wK8hkZ0osnxGZtd3pYVA3vTc5BL11m1OaNvmnAPB
 vEwquWalDxVebcPUhA0vHwIkkJbz64WC.ZRP90hgHA0pqdXVPZllDC64iFnx4xt0.gYhe72DWCqw
 HywaKvU25m.R6RXD6TXsXKPUtvey8nFZlWDbeCzcSVmiDUXEI0DpVWGfCqMURrjQk1dTrAnPzjft
 KDoTAZ45vUh5CO7skEnPDaNit4vXoNMwvrzunkXqoFEoYFbdY4j1m1TkC_qmdrO811lABrtwbOFI
 TdTliQnPpcRDk3lk88T28Fsr2Y3vd_Y1gFIKyOEFhSTqcfcqXgAF6VCajPIx46MH9zYzXK0x_.n4
 NA39Qs7ESuZ9BHpntp8BsaTbnUu1rrVLi7PtHCQqA9GOJ7d1FFFAURBszPzcTm.Z4l4bYisn7N9g
 Ka81DpZpnZqgEMkjXYRDqfm6lEmxME42ASWRBatl5iwFSJ9C7myrrbQ9cQO5pBZO1_kv13Au83Ip
 hWlX8uLmOdo9ydKgMOik36T0XX8wFJx7erwuVCJVr1uSh3Mt5wc02OausvLn.yVDBpuMRq2zPQI8
 NFklcSp5My4Nj8H0gsHRRsQ3LE521hL4.XbzyV5IhUz_bhcjhhB6SAeR9gQ.MuA4qBr4UvZTeKhJ
 nzY7NiwmsP6tgrSURI7M8PcaXMKo9H3quVHnGOucrDUM3YaS1i3_7EE0WrRbL0Nubsyc6LmsYuMY
 XzXT_HziEsD0y8gEUTmZiYduYefL5X_Dz7WojRp3iLJtQkQ3dgQCu.AlagOa9nRHTbAJs2pAG1Bw
 LNSbntjzcsXtAq.OoaKtbmabKHISBfMGEb1KEyF5hLyGs4glN2EhQ24BDT0XQAs6pBLc3TaWA.96
 oy6_imRr1EB6VJhp7vluGlsclnfsS5cR3xVCIBesKKqHdXQdrgomXkCBQMLu7r.KyQfVeL9iHAW_
 lECrfhnBHbe10o1iGxIv3N0yVvCl.gD4ODPrITGB7KwFDP7DWNuWRONJ3KpcwlFdU2a_izlUOQAI
 PBv8UUJHqhsWaFLR5yo_49ONthmAg34nXp1pICK.l0sOa8zbasx_4qvaBkXoCJ_kHJvcpO4aTnCu
 QEDrN7FGOPNdDNsXTFOyNeAW3P6oh6GXoveP3QA.rhG9jM9GZo0JiKBjUV1ppQOxvpaDTtbkCW8n
 5TCbasWESphVuTGRWP7bQ5xvwNYZ3haRIHHr01dG.wFTxZPyYNZ0fGOQUwAZfQNRph__6O1sDm1m
 6b.ZsiT9z1qFHPEdnOXgMp.Mx8PcPs41KU8HwIzanJDKtHGk_dZlRm73.i2SeS9IZ4iSNLkcSB05
 d.mr7OzXQmtr7KnjxSEMKNVBLxcWPe41CzEyHKR4mXq2tiNBsr9uUSW5G7L.WJFvZs.AFZeQOY9R
 vzDeTAgzXgxTNH5S7Z7MT8RnMYrsNmX9upQCOn1TqZDi7Z8lcZ8YLrhVs6oOkDgkY2edKQqg__Yu
 XyhfweNikAt6.b_REOVhVMcWncY8dX.7yomxOJobW0I1qqBgq4mVo_pSHcDgJbf2UI69TIc_qTca
 f94yJdTLIR51sdYqnh4kCsIU4vv_O8c7Q_Z.UkiDiAIdufvSjiY9_pNWgXury4FQTkZ9XKMGJmwR
 tE4NIo3gGqCvt3fEXxA9Khos1WGw3XJFtch2ckSy0wL80UPheHz.RdyY15QfWUHqbQ2C27HLZI06
 48NW.LJ2SIXGps_7PJug2HTUrK3JwmOW9vwa7ttxFlhCMOyngYOQ_Lu8XJiX8Qupn22PAnBvhOs4
 NdiqxsQhQQ4o_PMva69O_FAb8zbsHXq0ClzQF.JjIGVncSH48S_CesjJMWEgDffToYUXlsV0WvIN
 xt0FXfBa7voBUaHTFRZEhBB.HIhotvZOCEhaqQuN06x9IY5janNkxOnz_lqAy9L3sal0NZbbRv3I
 qZOtuABYKtKfKFzZUcJaWIq6AKYyZdJBsM0OfMq7hqZxDMOl3X4w5WGxzeY16s3Uk9GqlAoEy5uD
 GdGK0JrzcP5bP7wUD2FlnEnzsmfA9RDrU6tbNbG9G7C73U871U.xQinOzut4AbcESB4piiXdD12S
 IIvZsBo2iqUCU6qK3b96NPuOxQN1aZwMo1aQLwN7TLIbukaChB.nWiNwXU1ROBApdoGf25otk0kp
 Ttwj_izzz3sQPj5UW9DdKqf_MgNflA8gKq6t3QLyyRHtFAeBFCYVN0XGAtvT4uiYu9f6MAI2QSOT
 4TeI9KTClM.l2TSnvqVlHmVKvvFUuXgOiKZPAWF9OXY8yDu.c5ZZBlV1B0awMUkreYg--
X-Sonic-MF: <poulsenseth@yahoo.com>
X-Sonic-ID: 56dadeaa-64a3-49d5-be14-2809fdc03866
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic320.consmr.mail.ne1.yahoo.com with HTTP; Sun, 13 Oct 2024 21:24:14 +0000
Date: Sun, 13 Oct 2024 21:24:10 +0000 (UTC)
From: Seth Poulsen <poulsenseth@yahoo.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Message-ID: <572241092.1343790.1728854650969@mail.yahoo.com>
Subject: [PATCH] Support for Line 6 TonePort KB37
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1343789_417875438.1728854650969"
References: <572241092.1343790.1728854650969.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.22806 YMailNorrin
X-MailFrom: poulsenseth@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2A2F6XQ7JWNKTUH7GTOFA2Y6NS4YUMZG
X-Message-ID-Hash: 2A2F6XQ7JWNKTUH7GTOFA2Y6NS4YUMZG
X-Mailman-Approved-At: Mon, 14 Oct 2024 09:05:59 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2A2F6XQ7JWNKTUH7GTOFA2Y6NS4YUMZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

------=_Part_1343789_417875438.1728854650969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The Line 6 TonePort KB37 is a device with the same ports as the TonePort UX=
2, but with a MIDI keyboard onboard.=C2=A0
It can use the same driver as the UX2, it just needed to be enabled.
-Seth Poulsen
------=_Part_1343789_417875438.1728854650969
Content-Type: text/plain
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.txt"
Content-ID: <971a7a5f-6849-9fb4-e9ee-c62dd2ba2cbd@yahoo.com>

ZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9saW5lNi90b25lcG9ydC5jIGIvc291bmQvdXNiL2xpbmU2
L3RvbmVwb3J0LmMKaW5kZXggZDBhNTU1ZGJlMzI0Li5hNzhiN2IzY2M2Y2UgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3VzYi9saW5lNi90b25lcG9ydC5jCisrKyBiL3NvdW5kL3VzYi9saW5lNi90b25lcG9y
dC5jCkBAIC0yNiw2ICsyNiw3IEBAIGVudW0gbGluZTZfZGV2aWNlX3R5cGUgewogCUxJTkU2X1RP
TkVQT1JUX0dYLAogCUxJTkU2X1RPTkVQT1JUX1VYMSwKIAlMSU5FNl9UT05FUE9SVF9VWDIsCisJ
TElORTZfVE9ORVBPUlRfS0IzNywKIH07CiAKIHN0cnVjdCB1c2JfbGluZTZfdG9uZXBvcnQ7CkBA
IC0zNDQsNiArMzQ1LDcgQEAgc3RhdGljIGJvb2wgdG9uZXBvcnRfaGFzX3NvdXJjZV9zZWxlY3Qo
c3RydWN0IHVzYl9saW5lNl90b25lcG9ydCAqdG9uZXBvcnQpCiAJc3dpdGNoICh0b25lcG9ydC0+
dHlwZSkgewogCWNhc2UgTElORTZfVE9ORVBPUlRfVVgxOgogCWNhc2UgTElORTZfVE9ORVBPUlRf
VVgyOgorCWNhc2UgTElORTZfVE9ORVBPUlRfS0IzNzoKIAljYXNlIExJTkU2X1BPRFNUVURJT19V
WDE6CiAJY2FzZSBMSU5FNl9QT0RTVFVESU9fVVgyOgogCQlyZXR1cm4gdHJ1ZTsKQEAgLTQ4MSw2
ICs0ODMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdG9uZXBvcnRfaWRf
dGFibGVbXSA9IHsKIAl7IExJTkU2X0RFVklDRSgweDQxNDcpLCAgICAuZHJpdmVyX2luZm8gPSBM
SU5FNl9UT05FUE9SVF9HWCB9LAogCXsgTElORTZfREVWSUNFKDB4NDE0MSksICAgIC5kcml2ZXJf
aW5mbyA9IExJTkU2X1RPTkVQT1JUX1VYMSB9LAogCXsgTElORTZfSUZfTlVNKDB4NDE0MiwgMCks
IC5kcml2ZXJfaW5mbyA9IExJTkU2X1RPTkVQT1JUX1VYMiB9LAorCXsgTElORTZfSUZfTlVNKDB4
NDE0MywgMCksIC5kcml2ZXJfaW5mbyA9IExJTkU2X1RPTkVQT1JUX0tCMzcgfSwKIAl7fQogfTsK
IApAQCAtNTUwLDYgKzU1MywxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGxpbmU2X3Byb3BlcnRp
ZXMgdG9uZXBvcnRfcHJvcGVydGllc190YWJsZVtdID0gewogCQkuZXBfYXVkaW9fciA9IDB4ODIs
CiAJCS5lcF9hdWRpb193ID0gMHgwMSwKIAl9LAorCVtMSU5FNl9UT05FUE9SVF9LQjM3XSA9IHsK
KwkJLmlkID0gIlRvbmVQb3J0S0IzNyIsCisJCS5uYW1lID0gIlRvbmVQb3J0IEtCMzciLAorCQku
Y2FwYWJpbGl0aWVzCT0gTElORTZfQ0FQX1BDTSwKKwkJLmFsdHNldHRpbmcgPSAyLCAgLyogZGVm
YXVsdHMgdG8gNDQuMWtIeiwgMTYtYml0ICovCisJCS8qIG5vIGNvbnRyb2wgY2hhbm5lbCAqLwor
CQkuZXBfYXVkaW9fciA9IDB4ODIsCisJCS5lcF9hdWRpb193ID0gMHgwMSwKKwl9LAogfTsKIAog
LyoK

------=_Part_1343789_417875438.1728854650969--
