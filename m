Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2B5AB7F6A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D82862021;
	Thu, 15 May 2025 09:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D82862021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295243;
	bh=1N5n4Ne/priTrec8JXqgsUH8AQ8N52bIA6M0x84onTM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EqEK2DP+ZhUYwDTtf3uhqnqE1F+50Dq/sa269yTZp4cf3VmeA6tiFVPKn+/ZeJNKn
	 5Gsg8b88ZSCne31pxlgH7iRgAIojB0J+lqA1V1exoqv7QlJip97DXFmYLpAzDSRMEC
	 +2hYp6MUP1yC1ieLyhgJGgGUfg3UsZJmMNUjJTpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA52CF89BEB; Wed, 14 May 2025 19:59:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 907E9F89BE6;
	Wed, 14 May 2025 19:59:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90D72F806B5; Tue, 13 May 2025 12:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 744E8F806A4
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 12:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 744E8F806A4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=qBH8Wi/Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747131930; bh=1N5n4Ne/priTrec8JXqgsUH8AQ8N52bIA6M0x84onTM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=qBH8Wi/QC/xNNNmBQJgu82iVJP5AKAeQGAxazCulj2adq8sBJDsqqtKguagJIBQy0fod1dI5WRywyTDxd1/rX0VgCh/Y90tCLbSDWp0g+Mj9IoQUsdybpJjq7PFX6IHRYNPDyWL6FbH3bJk4msqpc+ro4awM9TiWZbeczUbOr6xJXME96UGnL5DutX6tCChKDbB/cby43DLnMw0gFjcXK6KlZkWsXIOTDaSCiuOy3SIMMmcl70cIWBW3L9vKrekIcN919fNMXWFsjABdXpNQTAJ/LMiJxd1DmLI+0drbJxltsJto8Q/Nx3JOy9Y8uL1c/wsYmco6qi3C4vuP7Yrfew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747131930; bh=v+QiIpoL41WG2hS/Z+RSmh1aMr5pXrXfeyKjrfTz+yE=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=N3awh0ua+3BL7cIb3AeXUqCMdXUzTVP7d38w2oaqnrMrLernIxhVl37ksnvl5n2DZ/0ARjpCuDM9sfe78BJSP/w68CKGZkGfPAQK9V1IEyREyndwSs6RFYZOFzZWPW8aH12e1+rM3MBR8f5PHaMNowjoPjAB4QkXma2KRGJ6jOw0OKmY+c96ZF4rDKINs3DEoMb1BzrY6zqwnM9wzrK6/cp890qnpPH9SaJGakCse52B+0k+zMJg2A+uWtg+56HxisWACUiTVCgA05Mms7k9ulOxWtqFUqeMTFxD+JvQwp+DLtRPG28KNgaYXQiFMeyD5jwFKYlHmm8xRNYwUf7O3w==
X-YMail-OSG: q5.tnk8VM1kyBSzaahFqrI_taA.VpNe0QSLdUzeVcV9ZiHHshe_Ll4YhVctU7sd
 QIiHovHryjyi3xqRGZvZSQHA.ApuTiMQjzqO.E5tAn_oLSrbW.ZGUQEbDuyoQD_cyXJTY.OkHmKZ
 VENx04fIUY4j.PxN0xE4aWDN.wZ4rov0t4DPnZiaGTQvKXQNJa521D6umOL6WMnudVIViLPYNt3L
 N9zIVW_FGo6pEo3JVPhZXFp1jJmHncg2zOVxoBtwSziTzb5zdWO1tgNShDlEDXum5nS93WYNrarq
 v0kNs_5TcbFKZPtn_VIg8io4mL6Pez5fRjV_lq8RibNsd6qP6cTI0Ms7TBlN3pJo.GCyRfyWx9_d
 VwRsOZNbFbS1eVvXVpkqZVhJHU9aFei0.H9sU8G9j9tkdcrXOQdsd9sXj_fHGK9mbRo3P_DlEwJR
 ClRS0aB94ezQQ3CBa1QYaKt2gOSdaDyQoLJJx3Prv4I61fic5W62j64mPJVZL_9Oo2D4lc4n4wcq
 ACL_F11nG0zqne8S5CqlwyrV0niuKmpulQZgS5Zsozum3lF8Y9e79ABENl6BjaW678C7BiamuW71
 Y6ZSSHc.P0qLv5EeA8M9bFsnfFoZBvcyJRsg_NaMbJg2W6OufAuRWE8pNx5QNlzaQJYUlWs1JwVy
 SRqr60LIzauIFxXlL4w1kEdvpN1qTNnhz56jzeMw8M7PGZ_nF6n2mVeE2DqkWEiDNtj2JB1Egc1L
 RPOttSkuleYwybNReToGtapQGbZ7Kac2Hmg.ACMNFPLanZ.8X23bHI1WuOmV1WVUR2iCP74g1TGU
 21F6IDLcMPR9tjs44e_oQaWen41244RxHS1gHRn.C4H.iqcZIjM0roR0LGyeIovOpvQ6m18TtnNL
 8Uc68ZMN.IOFv8KV0pQVLe2i09FpvdkRiwTlb4G_aDraIeHE.yaLbVXEV1BxTWUIVodldJ3xuM1G
 zm8MQ5az3GF3O6qjMR7hIDlK2zWGfZN1Wwn9YpZmxBZWsskub_Fo0HdhWizlqiSnlKcdSPuc.aK7
 PaqEn2VZpgMdBT0eR4wgmRatUSbB0sAfGLl0uWSrO82TIT7uhMOcjh5FZQL94_W73eIHxloNG4PE
 hqSECHDp5k9Ylor9smBrTLYFQmSFjWU6t2_8waRG7ttFZIc3UXU6eMmP9oXMPQ3qG62tjG89F51.
 koc3dVCS7638MHKkjCwxesgMLFKn_GTt4THJMTUaJTBuX8qQm.5l.ZhIq9ApukeODqWnSw2RF8j8
 _CvG0aqK9vSxSKieVDiLHQldDU9RGS3BsC2Tx9CIjppfQ_Gar4O2DSU9gINr0wKqLCDIWSJxa67G
 uqzXlOraCIMx_KeHi6Ux2pzps0vQkOvwYlsHPjW0u88oqNxOw0LYSJ_fE3gYnz4slnGlu5PkeIjF
 SNjYM.Fp_eV7DDiUKhd7UtcS.PcMESYwJmmHYY8VvfWsqQLHv41RumTs_6uvY8AAdlf6mQn4oun_
 BvrM_OEhdVwR50TYAEDeuVgG814u0YaWHRer6yejNcMk5qcsJASodIRGO1ifPQUdAb6nFdL8sfw1
 IneUJH024PnsS2aCp.O6wxdXUPv569sFptyU.mPilRHg8uQuz3XZ29u_6nMjjRisuVUzi7rhOoi8
 hQQPQpFQ5i6RccHYIP5JP2fDxG2Ti7ui9kwkDWsy.bvcWi0YoRY9eqBahMCcVp82M1OAYHDirvrT
 PKKRvVra9TBCVAdgg0OvSypPy5f9.sVVVCB4Ma.QT2t64hyo7xZdOZZFnqfl.bsKw29yiAWT8fAm
 VGWRDEw8aIccJpp2jOSVtfSgGNHE1zRY4nGKMNNFruFqRkJ2UIeT.Vpa5MwBwxOtVGa2GZtZc8_W
 dblzuTfNxsBXQVY7v.J4zFD7qrYG1Tcfiu5o0my8dkhvgpUO.IDMn2DSYZOHN07bH0N65zZQphTB
 mrBX1coYDPCybjCTM98uyAYPCwuzawBzgCLAhFqo.1CdKKfUFrh1qCiE4C1TOX5OTHFfEfM6qRN3
 PHF6GxKJao7AnX8vp7cfL0Vkjiv8Y_qAMPrn8fnQyK4aBDlKrsSHoriQZeqE3rggdvnCF3feEHiV
 vqSWPuemTiRXn6JQBqZwYKTW0yR8piwKdo.EvkIaRpQffZxmdlapGb9eHF25pSpqE1lYrm.EA52B
 1dlxENhtvfnfmSVxodlPqfrfPRM5aMJgO4EbJv82q4OrbHTCEkqqDOoJL8VhmH_ettlHnQHPbKzx
 .x2l8vyNPpzxIGxtV_U22B.Rm6zjjvMheGCuIpzy6E4FZAw--
X-Sonic-MF: <nruslan_devel@yahoo.com>
X-Sonic-ID: 98f42dff-1773-47bb-9c4f-da1ca83ff38f
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Tue, 13 May 2025 10:25:30 +0000
Date: Tue, 13 May 2025 10:25:28 +0000 (UTC)
From: Ruslan Nikolaev <nruslan_devel@yahoo.com>
To: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	kailang@realtek.com, tiwai@suse.com, alsa-devel@alsa-project.org,
	sashal@kernel.org, "perex@perex.cz" <perex@perex.cz>
Message-ID: <362743264.827582.1747131928735@mail.yahoo.com>
In-Reply-To: <bug-220109-229339-9HzhKc5gL2@https.bugzilla.kernel.org/>
References: <bug-220109-229339@https.bugzilla.kernel.org/>
 <bug-220109-229339-9HzhKc5gL2@https.bugzilla.kernel.org/>
Subject: Re: [Bug 220109] Audio disappears on HP 15-fc000 after warm boot
 again (ALC256 code path)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.23772 YMailNovation
X-MailFrom: nruslan_devel@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KRRWPJVHRG6M7QBUHOBIFCMSUOLJAB3W
X-Message-ID-Hash: KRRWPJVHRG6M7QBUHOBIFCMSUOLJAB3W
X-Mailman-Approved-At: Wed, 14 May 2025 17:59:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRRWPJVHRG6M7QBUHOBIFCMSUOLJAB3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Kailiang,

I added alsa-info outputs to=C2=A0https://bugzilla.kernel.org/show_bug.cgi?=
id=3D220109 (see attachments for both the regression and reverted changes) =
by following your instructions.
Please let me know if there is any other information you need.


Thanks,
Ruslan



On Tuesday, May 13, 2025 at 02:30:17 AM EDT, <bugzilla-daemon@kernel.org> w=
rote:=20





https://bugzilla.kernel.org/show_bug.cgi?id=3D220109

Kailiang Yang (kailang@realtek.com) changed:

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 What=C2=A0 =C2=A0 |Removed=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |Added
---------------------------------------------------------------------------=
-
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |kailang@realtek.com

--- Comment #3 from Kailiang Yang (kailang@realtek.com) ---

Could you run alsa-info.sh to dump codec info?

Please do =3D=3D> echo 1=C2=A0 > /sys/module/snd_hda_codec/parameters/dump_=
coef

before do alsa-info.sh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You reported the bug.
