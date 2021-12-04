Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5612469258
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:26:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E7D1FA6;
	Mon,  6 Dec 2021 10:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E7D1FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638782794;
	bh=2SBWyfOLBccLkLmxkFufZ+IVkohjSe1U0/MvMvmoPmA=;
	h=Date:From:To:Subject:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bntByFr4ShMqtomZVn5HASlDcqvFufu7bH+VivwBI42PT59pawS+jC0fUN1/3OSrl
	 1fYpVQlg0WMgJC36Yeo0+XIKQypiIF/v0n23VFZYpWYFNRVyBA5eoigzAxV1fFdZSA
	 bkDRoiVR8IWvcTee/Jnn6fqfhN+09G3X111eGAcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B845F804F1;
	Mon,  6 Dec 2021 10:24:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB07CF8023B; Sun,  5 Dec 2021 00:36:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from sonic311-20.consmr.mail.bf2.yahoo.com
 (sonic311-20.consmr.mail.bf2.yahoo.com [74.6.131.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37864F80134
 for <alsa-devel@alsa-project.org>; Sun,  5 Dec 2021 00:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37864F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=att.net header.i=@att.net
 header.b="tVCWp1GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1638660968; bh=P8d2sq8JxCs8A8a1SWLPnyidVJFMTXIc0yK6QrdKsyg=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=tVCWp1GM2at1Dx8ZmrR85000ORz6SxhJ2Rr8X/DzzmD2DM7K6Yb4OtHK2440ugIjqvKHQaI4+SW4Ynv3r/9B5WGLZBWO47zJmvyyzNLCCQTvGiSWYlKauL+vcvr7/Tb3diU1ILcZsHtcIejYZ0UvNAzH43w9UYhCbjBkPJlUwaQ=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1638660968; bh=mosWu5LFINnVbwtO38LSBlSg4HZmm/pG+Q76YQcqhvT=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=bqjMYliuwPSFeFzIov9CmgcXhb0ZP8WS7QbixlaRMEeiMi6Q5hCgdU9tBojbD1rLuUZo94BKDeuAUIqS7zVeNlBJnEc7sn6QWqRoG3kRgeQzDJ/pRD1N1GTrvJ/ewedO9MwPRPcDJ4hggOybtKpS1sz/oE3MENI2K9xDgSlsPAXtZdaPnThtYi7SCShBoo0WsitSaHOgcjiz1E7MAj+U/PnvS1RQ2fsd8wHrFtOxDxncLeFLntI1hkxC0BSHvHLyEKHqzwEyyTv09/OWgxFFsc1/mJ4Vfyxp8ndGPx8aZpus7pOps5+MkTRhwilqDJJRJQdhFb20g1afujAkUAnRRA==
X-YMail-OSG: tp3uzMAVM1mmIUJ00X3pdVNw6GiNs14SzocQVssEAVwqj_TL0wFQfhh3Vb5SiNV
 bHAcEPy2thOhzHqZ39I2rVWO9PSPI_FqKOd3TUsnSf10O4OT_lyxxNidn25kuIo.aDtJNNmSMUgt
 TLgAJXmBHa4HF7kxZzUdCWXZbDMc9m8xJFJhNxQ1vfYytkEA46ttB23AqRmLL3gdB.8s8xIcYGg.
 LMdrA_WFGRvPxPG9Rt19g.uUaj5Sw6dOk3lSF0hyhiNB.rkq9W2vCo0ZgN52Agxm9hL_WyJmd_94
 v5q1kTdbguTMuqn_WU6qYdnBsDxI.FifloK2heV4QHZ5cB33WhlF6.sk_asqwDGJJtzAml6BCh0B
 0xkDIVGVZeQk8SMccpbXZTBx3cpFxuc2lwlBq5tLNAVlE0o22Se9lyiQhfjPVnDxq.HvqrGPVmgZ
 BgN28PQt9kt1uQxV6FlfFtElsc6EQKc71V46VXgCfzUUyi0hcNf6TQ3_R_WAOrlEHmxprui60jJu
 kh97DO54w3jHyAe1QwFSLmHvPpMOiHiNIJVoIZFI0CVj__OOsBj228143mbui1_LzJpVVW3PbHQC
 4ErXkmtdIiIrZ9xlpEoALmXWmPzSNh6JB.y28cNlt2mjIKHeTbHfn4EPKTWYcc7o7CvMeFrcbO3D
 hItNKp1vpwWrZ1ENZ26_cSre0IKHFyOG39fR4zxKC.PncxWtzmR.SS5KRyN_iIHJDwP7FtwhqOAA
 ebzuMo._2B6F398mDkvMz5Prs2ABoDYf6ePbul691TTBDhszsckBTtx7OrQFYJbsgs_u1mrUjNrl
 AqgSaIvnpqkaItVu0DmCH_XiYRXk2f0tD4xkobgKCDCdipswoXl80U4SxrZs1ABAJyjP3_celVUw
 y67rp7oM9SsCul_o5IZBMssehpnUiMS5QjqSybdyMFcrqW2roZJrgVcQmbhHiKnAtt1XgMAc.UJ8
 XInS8OewDa7ESPvEIG2iQLZvyjqZrn2ssywHzM4flZ64CLOuK8Dz6WIwTXTnWAdavl8iLd3znorD
 H2yJZzZKzkY8AUbVDfU9v60YEW53nIw6mBz0WDCMJFdM8CA9s8Cb6GtvwC33I1MtoxjKPyaft0zz
 T5mUzLFuffIGvifsPFIs_fxcONW.PT9SEVdryrz_ivmRTeIqWznyjrHp4ZMHS0kpIbmMmTkkjF.g
 PqlHzDIglRt2VvWVmQ5R5vamX15nJA55WQB26PX.Tl6GQtFhQY5.39eXHeKUW80308NaY5tWTIUH
 iIelx6hQ8ju1neTW7zTRvW62U1FE.AIovjqS6X71gpD8uuIesqjXygpGTCzLrjBV0ty_QMc6YJkx
 pLCmgQ6U3rpyujooWd3d4BVzdupwOwcIbge.JzqWahQEptCro8C.p1pn9BaPYOMIKLFcdGbu95VX
 JwdT91AQ66QMw6pCI8wYzjt7ezPrn_HcvV.qoTNBm1WeBXaKlnZIbZk1gKaJrtyV5w7zdxTQNgAc
 uJpp.YRGQ.lbHJPPAghGEWG3mEyNexh7Pl6foHLnBOZIn7s8udMqZsH2BOaUzwhelDD0KH7iuWGY
 Uwp2SI6.l1k2FjzahBvRaksC4qvmKyfYr_FEhEUTkGt8HsssxqCo291jUpDTjzFGVNsDqmZGDvg_
 nY3qMxEd7YZUJ2lcJNBAVzUv_.qBSpb9Bh5EIFw.zFXokCs124dIDRarufGYpuv41OkxEbqD3ofQ
 9M2FkSeC57GYgFzMVnXVL_3UjYEYhENfptDE5fwuCMwrn_Zv3Qe1_jm7X6xKkltVKG1B9VmFYqkL
 p2TVdGx_l50qKbhQ0151ryQLnuhmUBh4tfsQ.Fw_RDZ.SqPrWVNF6RzvvL1kQtiCiBVUL2hHJR1.
 Df5GfDcKlqT1DZLR.rUSbUcFqL6s4GeZclfKpFNp3F7SXMqcNE_wuxt8Lq4JjKsDD_VRJi.zyo_p
 _ts_hM2IWM6oajfP0CU8I3hwv6fpBU_zbnx4OfZDYdrjokooJUQJXfIkFi.Ei5ba_5JhhbKDMYV1
 5VMntz8JLASv_koY.1zBUdFD9LioIYq5j5C2jIP1KiRe7QCRJWES8deWc_rl7T_hTSD8kVQ2.toT
 x8O_Dn2LWmRZctrdikuC._RkkB_E55IA5oDx_Udug4kHx5wWe19avMIsnEugpIHJMmOC8hpw7tEg
 2mxXVleBLpWn21bvYRPKFgHmkg6QCHJaVJuUyeFZh
X-Sonic-MF: <kilgota@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.bf2.yahoo.com with HTTP; Sat, 4 Dec 2021 23:36:08 +0000
Received: by kubenode548.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 0ca99bdd5a67f5c7cb8eeb32825bfa27; 
 Sat, 04 Dec 2021 23:36:05 +0000 (UTC)
Date: Sat, 4 Dec 2021 17:35:52 -0600 (CST)
From: Theodore Kilgore <kilgota@att.net>
To: alsa-devel@alsa-project.org
Subject: GLK board with ESSX8336 sound. Would like to get sound working on
 this system
Message-ID: <0a98323-e429-ea9b-fb8d-6eceddd9215c@att.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
References: <0a98323-e429-ea9b-fb8d-6eceddd9215c.ref@att.net>
X-Mailer: WebService/1.1.19306
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Mon, 06 Dec 2021 10:24:03 +0100
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


Hello,

I assume that someone is already working on this but I do not know 
who. I have some experience with coding and kernel stuff (see 
drivers/media/usb/gspca). Not experienced with doing sound support.

Theodore Kilgore
