Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0FAB7F90
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C7362019;
	Thu, 15 May 2025 09:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C7362019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295243;
	bh=TQf5RiXYKd+8VoWEbuCU3v0PnHXgP3Wuw8V1KFhUltc=;
	h=Date:From:To:Cc:Subject:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hrEsp1IxigCjiGFNVE8+WiTFZDFBeQ7Owb9HdwDl89lpapxJ4cQ+cLAXs7jo9UuC8
	 +NQmUwJPi19zKdMs1qSnT0b46j0SiTTpM+wBTvRxYr3Tk31O3eCSJWM1CmM3Ug4YmP
	 BjwXHGXdFEf+PIvMhsAZ/XeuKWpSn2tDUE91GS+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE4DF80636; Wed, 14 May 2025 19:59:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71427F89BB0;
	Wed, 14 May 2025 19:59:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3BE9F89A18; Mon, 12 May 2025 16:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F46F899B7
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 16:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F46F899B7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=iseRrAmR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747061779; bh=TQf5RiXYKd+8VoWEbuCU3v0PnHXgP3Wuw8V1KFhUltc=;
 h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To;
 b=iseRrAmRw/fkNREOKKDI0NPiLZb+ct2VdlovLlt1fgLcCBDHybi/GQUeWzPF155+sTeCKuYHjXLN1OF2euhn9lt7KgZlD5YOhWDYs+nz3pp6twsmyrt6asKzGj6bODxBpXMoNua1d9uZzmMxAeJW6RMcf6BJXENohTKD54huLFkYCDbTbzycZGyZK9Im7oeHfVZrOdJUUmOSrDldGdOzx11829wK+H+InzZG1C6PXvqVwS23M3eSZZwX6ST2W0SHPmMKMbwMgl5sambqxLzQWZ8etRONW2VN/xSE9FnTSJ2P8Qh6EmbDhsh0LGI8tITIeu+9ScLFIW6fJdRAGXptlw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747061779; bh=lBnMndUIbc0AKFc4DiTXsv+edML5QjdE8RoLZzah4Rw=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=X953IwibabfuPSqpZnOS8SPxUyzppz328uOccDK3eJXBEJ98Q8rn71jPfuFdEK3+AdHAgQzvIZ3O7y5S3jyc9JHF6RO69tegN7JxNilXKKXfMuAAtNxs40QxRAlZvu11EMnUiSwuA0Xq7/23Ne5AcWihnHVboa/t4n+B4jpMixHo/wwLJ7NuAjVPPzakJcsdqrhCDAqo8k7mBc1Ulu08/J134pXHIVT2HWJajKOYaEWWVhnOhX5O4nDrsEaZJAN9uDKz+gsB1IwAGiwVyPzpNjwitdobAreVvrxbaYmbbUwFDRpvRbdiKym6bMJOATL5ZftT21i/In80cu6guDQxSQ==
X-YMail-OSG: hfN8oUAVM1kjwip8lEbFPQL7ckZNRSDGmjx9auU3VGaadDRftLDfz8hV2.u29sF
 z74lbLnI35b_TnCCIzTP.2NpdlMkN3VTw_dIKdYbC.F6GK7bMv.fRT.5clvuZN7r7ZUQL1dYRdv.
 zvGQqAQEB7Is1d_f16ERv.II4ZYN88bieYImCx9ptM9Vk_lVHrJ8nQcg8LprODyUwjsTzT_tsFme
 DtlQVOTb1GOqbhZ0LqNuSlCn.vxN8ZJzdy5xnRKBWWOScMH6jAi1ALnotWaeL7EvOmNoWk73k4bw
 KnKaqHwGt8F8v6mCbzXjrqJnI7PbGJEUbtTMTRQiUHlV4dzRe.OmL5Tby8WAYxFhqCsO6o5aqBnB
 EAaXdguDCad18qjXHz1ae2wNrGliIWNOUpNTDdL_OzbfX7hatZvtqdUYVkcyFXhqTN5QNRZv4nF3
 mSltMA0.7QB.DUHsyfudeAnGuA.76HO0DDwIpmpo0BC.KJBsiqo4M2CH0NjlUBxeHFy1R5Qr6eV9
 DmKqE5PvoW8hD0fqtVWlOp5v0i0BdbDj3N1x9a01pGhjY9o2hB.Hi7mD3RQuISl1Pv23xOn20l2A
 c0IsLEfx2l_EdG36UeqxSJmVTHOmbAuEfGahGIIfFPZ6TT6tbwAXLVyQrnJFGPXfzupk.5YJNTd1
 8tCXGkRip5orP_XSOEuRV4Ij4oiax0bVmPwZI_zn7bw.dux5vLKchbW_vX9tzzSqZivUXOkYBvTg
 5.r28eAY.vjPwz6wjlKGW2kQZrB033kiA_IBCRpld4yGJNT_prPFZ.cwnWtc572X9uqabe7W5Dal
 vBNX_MKuNq29VbvhEmwqemDFHAxpy0w_7B3Tzw6YIVPq8fFSGvNqXVlj9PQ_JDSBM1Acnx9NLkZf
 xwQdSGuj0CrBykWDZ0qrlq5cE2BUHR2Dc6ot1essX4gQckaPt0AlO1jnRl.yygNowmLeVXhXThRo
 yfP0lEOgmT1a5i92C0nf0q8_ipzHC5Seo.Fxst1ONaMlr3sON_yHcvAs91YuBI1e.aO3jRx3pinO
 vxFZ3nxTATFRCIVHAXW6kT2cXWwyJwrV87Ub9u4VhAS.2ont_ZJ1fCsMAj9GoJVdxNHX.N1dfzmE
 ErMjYWs9eZf0zsdjB.eRs11RkODhH_Eg1YDKuDG3xlORaYXwODBn619sJ.PPhGMUz2H9WVkvdMbi
 xj8Nvd0UtqiFIwRUPBdzfHetK.2eWYhrKaF6C71Xu_ZqlbICqJV_l9BRizX9xTGI2hJuKYcV900h
 ew7bR61NeXEfPZyYddGFH26hO.AnJvYZD74KUeC18znfPUdwGXykAMJgBL4vr_s8TnAmNoHyAVGn
 uBMcIWyh00JHdFSF_mS0eISuozRDxNSOYKOmNa3BkjxVtHDjACB2ex9oHXkmx_cfsbPuz8VZV8GB
 rkK86NBIHkW07k5Objqou02nFYgv4aYVIBmv_Y36d5NTnUgOBGdoyyOnOJcXJx1H_lBPFuVUSRpj
 dArfFdA.nuxEv891xrLcamiXFFzoBsXlWLhxJToz5WceqVdjUQ0VFoaXmoS3zXBGv04gAF9x4KQg
 gxZ6aV2w.N_GnoEE_TICP.KbeqoYYLvN62CnzcURBV_atPWw2f6G5_iTeNtVZSeap9cogc20cr9O
 N.rL3jlAwZQZbYhshXerjXdeVUruJjRBRyVPISK0I3MfSJ0c6j_wIDFrGQ93KUdZVC0NMDScxfmX
 tQwp5qH0L4QCzUEqyw6ei.4X4vXEFZo8896y._xMBeX_92jr1e_V57sPoZn7i7yyWw60bCH7rI1z
 QE0guPiY4IC5yOoNcdD4iF7Q1WHQUbirtVaRKj5w22vRVn8XTZkIDza_8NHVqK0HN11uId7kyBst
 vZaTAcGpWyQZ_pQcqG.5D_h20tqaO237HoBQYJMpFDvY9A4Fe.Vwpi0vsdMM5JVfIyZt1yuVAMRi
 itF.qswO1NRVcV3yUPh_bCAmYzhXzi4XGO9bfgPYLpBQjiwv1zGkT_3.tjM2qhXUxl19aN0dS3vU
 3Dm6dI1BtQBROvpq3uKRoWH06azbXymBQtOzsJnTybNDz.OPujZbvE._6vE7ajc0Ix9ncQOUDsHW
 6miJyXLVo9crTlyNys22wfOdSTk9yeg97XAGVCTsEcri3H4WIbbAfdcIKqNTWuA6G_k6CsAD5VB8
 .IIkCW_HjaKewzwCoViVclCQ_UeaniJcZne_7OOraAVpye9dcZMHSCtkdEk3ZUuamcBFKHK65igI
 m56CzHmprR4wgmyqoBKg-
X-Sonic-MF: <nruslan_devel@yahoo.com>
X-Sonic-ID: abfb1eb2-8db1-4869-8252-f0ef297b5926
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Mon, 12 May 2025 14:56:19 +0000
Date: Mon, 12 May 2025 14:56:17 +0000 (UTC)
From: Ruslan Nikolaev <nruslan_devel@yahoo.com>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "kailang@realtek.com" <kailang@realtek.com>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"sashal@kernel.org" <sashal@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Message-ID: <1064773772.509063.1747061777318@mail.yahoo.com>
Subject: Fwd: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm
 boot again (ALC256 code path)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23772 YMailNovation
X-MailFrom: nruslan_devel@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QNXRTFUUJGC3PXLHN37NLJL4NNIP73SI
X-Message-ID-Hash: QNXRTFUUJGC3PXLHN37NLJL4NNIP73SI
X-Mailman-Approved-At: Wed, 14 May 2025 17:59:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNXRTFUUJGC3PXLHN37NLJL4NNIP73SI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Forwarding my regression bug report for HP 15-fc000 / ALC236 (ALC256 code path).

#regzbot introduced: v6.12.2
https://bugzilla.kernel.org/show_bug.cgi?id=220109

Sincerely,
Ruslan

Forwarded Message (see logs in the bug report above):

There was a similar bug in the past (Bug 217440), which was fixed for this laptop. (I believe the code path is for ALC256, see below.) The same issue is occurring again as of kernel v.6.12.2. The symptoms are very similar - initially audio works but after a warm reboot, the audio completely disappears until the computer is powered off (there is no audio output at all).

The issue is caused by a different change now. By bisecting different kernel versions, I found that reverting cc3d0b5dd989d3238d456f9fd385946379a9c13d in patch_realtek.c ( see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/sound/pci/hda/patch_realtek.c?h=v6.12.2&id=4ed7f16070a8475c088ff423b2eb11ba15eb89b6 ) restores the sound and it works fine after the reboot.
