Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFEE80CB28
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:38:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D2783E;
	Mon, 11 Dec 2023 14:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D2783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702301885;
	bh=LRJcVo8EKG1n5tBNcnasjM7YXbsS+jhRDtvRw5uW1SQ=;
	h=Date:From:To:Subject:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BbDftvY1yzydHyGCRfTu0hrOfm6V02A28Dmx+GTBU6Msh8DjD0I3xwfE2B4du56FK
	 LMm85IaUX/zFR/aAQ1OIerMyzXPUyviiHLnNpRwJmgamBRbiYN9hueQxRow5Wa+qQJ
	 iN5emia6ZM0rc2yDs5ItUWhE+gKpwW3LFfNfKRzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA280F805C1; Mon, 11 Dec 2023 14:37:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C08DF805D7;
	Mon, 11 Dec 2023 14:37:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD7DAF8020D; Sun, 10 Dec 2023 01:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sonic308-10.consmr.mail.ne1.yahoo.com
 (sonic308-10.consmr.mail.ne1.yahoo.com [66.163.187.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FA45F8016A
	for <alsa-devel@alsa-project.org>; Sun, 10 Dec 2023 01:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA45F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=LA9g4EYZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1702168408; bh=oFrCrJ4OwXDjIH2p/uFtbfx15JS5ZMvEXGdIvdK/R0s=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=LA9g4EYZsaD6pKbgRKkfrUz1K7QgYfnEJ065rjKziXiOVgBGC7saUXnNNyKMH9vOqv1ogZ/bHXIOsOYsb9UB6PXs/Y2eKlYyvIBIVRpkmZnnHoSnIFcXtaisBuL4YraHkBoBo6XAKCwbldAW1CKNTUQqw7HaSKV3iIXPtXhz958L4fGjzoFkn8rVtb3cqACcltdK4TgDG6Ed18QVOiK+TcsoQu9oagZT9JrzHS00ihsCWmJ2qaxwXvtHt8Lrh52hUq9Fra5QHvHDMsQQ3OspCgiEEBzwo5BDEqsv4mQIlNWC5QPbF3AjvcWFI19M0FNXrsLt4o2JxlNyB4s+dapfxw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1702168408; bh=41QO0LZ9Y3fbbZrekDJAxj9aYdaVPQhEhPhTEHJmqsl=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=HgaLADX+tBRf4lODLjrcBL1g3Gd1jl6QCSbLpEJPbKUH2nnJfkbHESJ24v0IpzDyNtb/PfyF0NVnLkrHpFqtbqSoF8ALpvEQMXbR+gWFH8AMugWFCOoqHSOmcAduEbb2JDC8vGa4yRLK2V3w2COYBk6m3d2K9KL3dfavNghxv1pBLUgqGXqnilKXeW4MrCeCQaYvTb5BHbW338Fu1vZHe/e8XN5l8XCC7bWR07IE1Xs7bL68fpu5g1osHa5KPNiUCZRBfBVvSi36T5kkgnEf5TOPVUjG4rW6VO0OdEt6CV3yyDxKSXWAMSvLXJJo103mFe4XRWsyUnBUQLsdDMvRSA==
X-YMail-OSG: _9xckCUVM1nAfYa1v8GAvsMJyW4FsBSvbOTe23EUkGJbkXC7ZTRfkNoN8WzlXNF
 ToJytToctzVZgCNkgNeHcH7fhn8F5rtOHyGL7yne1KyDrB_.sWFkDlPJgwLNigxqoZC7XCtffiNn
 H49XwVB4CniNNWMtqRSnMuIc6tX0cAjWevJfvgkKQFlHPmEHOLFrbgu5r2Y3NbHJca3IX.CJXfdO
 g3zOGHhUnBvhQ1fpBQ_baTLpGNWR_zys94h7Cdhy2ukMxIJCI.qPnNRdFHdRA1vFY_D6M3DjUvLC
 tQ79h8P6RKd_cFygrGYxK_CBS.GsGeASTn3rb.1XbppgGxGhOjqi40TW3OqZxFqcKbnkSnpRQgos
 1ATlfACg.dMNUO79Oyvuv0_LbavayBqLFwfKz4ZAHTY07HPDJRB5XyYKKDZSmxTTufMWYsu6LqPF
 Rin7cdnVkUleInP7AfvYDQ183v263YvgSqGtltlvtRHrhGvkCVOZTBQfW1kNWkuqXn8Cp69DL7fz
 TJD7opmoFlQfYAVrs8G7BP.1_jyQlDLgVszC27VVG0G6RR6BPnwBn9ixYRlYHQZkqqd9jtWuQmqb
 QSLTBoRBaLGmH4VNjU5AUF48fm5aiYeFGkfJDSKO5eqRzZHm5uWGsca9Lp1oCwHoZspvuIjtWIvP
 NP8SQ2rHElphhUetEIpDCfOg1wNhBcoy5xasxOv7pJUQ_eD0LCcGQemv2m_AQYwIdqGpdzGm8XmS
 Uo6GxLrF.AUaztv7de_yfb289Iv4eeUIsfnjOakyt8WA7vgRy8K.3PSfv0vgtBcAuYYPFcoUR8vq
 X4cB9V9SqWRt5_2ggwxLcOUjATIyMrBr3jUF.NlDeZw9IceJOhvtRNY6IXtCZsdjgp4mM9chBehM
 fSo24nrlXFmCd4k6ydYWKy2sxz9hnuXdc2ogD7eB9P5gFRYHSp_1KSNQnGTmjSwDK0qJS_37Kq.G
 FiLn4zg4bpn_tSdGiV__VBycAPmhUD7o5DlHG7XFpZSWGLsQaDcGGYXq0pKstcjjUeAFxsjEkdRg
 MvcqlECZMhAtFDJeFcjkg1Nn43dLgS47HspDkVxNokPBLkugRkLLEgl58P9VJ1vLgWKbCkp7JSlV
 4qpkASfW.Zc2iFJ4aItB9NcKTv0PMn2NjAzhr4o57nKGIGM45GkoKLrjhBOmT25enQnk603lyEe5
 BFkDLkvNCH4NrahATdeIFpnUKMNCq7_SE9sWUsQS4sIjUvTT5mylaiqhm9ovQPm9J4QguhkyCv9m
 lrch3DTh4qIUNC5mxBkrnUNu2gae_xLlQYWgK5kjaNNgump13Ws_R1TGRKRNsJDbhJq3JTmXbsvM
 nTVVz7Rfyt1fPYvnSPgBkwe8w1opdixQO0HnJB.ljylGEWa6uX4DDPkh2yUzYcdz4rU4TsaZVVKQ
 cVDhOA1LjzM5YovynlBEDAmHagMu5gZHvBYnk8EMxmdAfkrobMnogwG.sJffjshE.Y8WNhpPTBZ6
 w7vCcRR4DexFEyNbbGEJkN6gf4AlPT4wm1fQ9AEARU7KrdAFVGu1udIQ2fLLAec8c0MeuFhleygh
 YgmHnZ_Wx30DQ.IR_ed2lMdmbH6Rc1WBx1uZT_BynFokmOUYBR9H3gq1WmK8Q..zoKX87pBGuY8_
 LMoSVKvH_KIYFi3p_QUCODBPDxMO01W6ZZt0hl5_O6yYW.8S0I_CApQDFg0D2FgPunWLryJo38Jg
 VG.g1WTuNhQZSMtTxaTRyCe1jC3yuZDoge4i6ODB4mQJhFaxveLZ.i97zOTJkJekuhuPA2MnD2x_
 L67P9Z8l49N.LK5_6Dwl3fDLFl51JRKG7mOMM8AIiWlPxD1hRxZDAroUAkIUiNuy6X.np17RXGcL
 vYCaPV1MLlV4wa2uLY13IPfCIb5iQMiZFNg83CeaRITpSv2aTNPgM47J10k7f2Oo1EYpAPl11vur
 glbCw6Ms9eVVmHjUeLarvZ0_DdcGppE2vylBSoOIy6ENXRBoQjsT0YokdIZ7mIajNKWxi5y6X0v8
 f.FigMeo5JKw3sbg7J0J0iVIyKFsySnLcGQbUjB7O6OKipXVNthzw.YTd6FArSAIbrTJZcbs6Qhb
 EFyc81AF060gQema_rBHGbe1NfhG6OmqrZmzl9vV5ggxAMFnUSTKK0s3I0FQPZf5oIvxyJkbJOUg
 9.NO_qhll5gMiytGroGRn2wPLT8NCjT7Aexl_14hP8H.nP6SBPbnnJlY5704R86.ID4SVAIbwxdm
 1rmeGjTAe7TftSEP.g.qaj_LMInZLcgk-
X-Sonic-MF: <rbhagat06@yahoo.com>
X-Sonic-ID: da4fc246-521f-43ec-b245-dab734103456
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sun, 10 Dec 2023 00:33:28 +0000
Date: Sun, 10 Dec 2023 00:33:26 +0000 (UTC)
From: Rohit Bhagat <rbhagat06@yahoo.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <810427772.2465712.1702168406223@mail.yahoo.com>
Subject: Ubuntu 22.04 LTS and ALSA (Crackling audio on youtube playback)
MIME-Version: 1.0
References: <810427772.2465712.1702168406223.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21943 YMailNorrin
X-MailFrom: rbhagat06@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GCKI3FR2WDAXXTERWQ7WMWYXDHSPRGMR
X-Message-ID-Hash: GCKI3FR2WDAXXTERWQ7WMWYXDHSPRGMR
X-Mailman-Approved-At: Mon, 11 Dec 2023 13:37:05 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCKI3FR2WDAXXTERWQ7WMWYXDHSPRGMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Q3JhY2tsaW5nIGF1ZGlvIHlvdXR1YmUgb24gZmlyZWZveCAtIHN0YXJ0ZWQgYWJvdXQgNiB3ZWVr
cyBhZ28gKHcvIFVidW50dSAyMC4wNCBMVFMpIGp1c3QgdXBncmFkZWQgdG8gVWJ1bnR1IExUUyAy
Mi4wNCBidXQgcHJvYmxlbSBwZXJzaXN0cy4gTWF5YmUgc29tZW9uZSBvbiBBTFNBIHRlYW0gY2Fu
IGhlbHA/DQoNClRoYW5rcyxSb2hpdA0KDQpQbGVhc2UgZmluZCBhdHRhY2hlZCBteSBtYWNoaW5l
J3MgQUxTQSBkdW1wIGF0Omh0dHBzOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj0xZTNlYmIzMzU4
ZWI5MjAwODY0NTYwZDE5NzhmYjQzMDVkMmI5ZGMwDQo=
