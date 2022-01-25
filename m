Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E049F655
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:29:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0241616F4;
	Fri, 28 Jan 2022 10:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0241616F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643362159;
	bh=/YQVAUoqjqVfC6lWrAJe5ahnJYJ4CJBAm/cZClFkuQE=;
	h=Date:From:Cc:Subject:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=UFZyAArq0jomnPfgSb2eHJYPwdkq4K9H0+J/WCN+MT9lM5yK8MVwu5vkZWPoNldPi
	 aAbyjF+XkEegmeWkhucDeii7ZjT9cjHLlOs/kkWDZ2FRI9hnRGs9gmRA57l2XF1Q3G
	 zsh9jcA3J6t/ZGRB2NbDfTs+JrdgLyEYRDH7oDyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1A2F80549;
	Fri, 28 Jan 2022 10:24:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADD4F804C3; Tue, 25 Jan 2022 13:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MISSING_HEADERS,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from sonic314-19.consmr.mail.ir2.yahoo.com
 (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 325ABF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 13:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 325ABF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="CmbOb7ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1643113901; bh=V9+1EdFmJoTtS3PX7TDeBMTyC8T+9e0AWj9u5rFVKeM=;
 h=Date:From:Reply-To:Cc:Subject:References:From:Subject:Reply-To;
 b=CmbOb7ESdpLcfsz/4ZQ3+PwaFP+U/5LZSXJBC4i00XVYLwi64bNjL13UAKrt0vohhT4tLtmoOMDsxOa6RzOXTcjo6hyyUAU0hJrD09qdEbkZhXgBZ/rLFwJyLDTaO27B7M4Ss0xgRa8E2GJ/eBcj0Lg0Uxs6PgqO+FHQNc71QnH34BldJoi0SXFuaVIQJieMFoLBMM+jDxU/co3FCu72GZpr2HSXGpdPUBSml8EN4Gtc44fjOKHKAgYEHKFDBFTB2ZKh0otsQiyWwgWkA5Y/6wjUAQtabzechAONnyK6ZwbeZPJrlX5Di16e5khQMsoAHgY3qkpsHPJgbn2kvlUecg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1643113901; bh=dz6hVT/N496Nw7a26Xg8ubLJOqeBHiWPrkyRUJ/h4ep=;
 h=X-Sonic-MF:Date:From:Subject:From:Subject;
 b=EEdd6NPb6BSL/NBXZrVrtDdtj11DeCCPVhbi66ovj6ofIgJ/AY6KCgUAFnGh1EPk+JgG5espRtadzfX27W1tLHZleYfAns3xK8WDgo1RsHOnMpbQtBx0TDZGTFcukNDiQMRJZ9+VJQ/3U1+WgEV2gRd5rJkewZV451NGy8v9+Pb6E8no11AT+oTsDa4Rz9H5kuaXe667mapd1AnTtqhg8mIlq11eFLukfh9FwpbZiA44xqOTqqq/j6pdz0BcvzqngBgPOTv8tViyLjczX8v/vEefUXdOusw9lJ6MyUXqh42ypSjZi2Y7pNSGUUbuPCdUCrwBXLFLg0NR5X2TM5Jp3A==
X-YMail-OSG: mdYRZGYVM1mDPmNd1c6b53EEpSK9Uwr36Diocd5hwsyGsf7RhbraeIRNZ80VZb9
 w3wejv8XFI4yKNgA4kC9h2RCL7bvMy36WZB170qn_ZTH2iz.tPZAUeX9Lw_7UEAWZABUACE3kMwK
 xObwDD_Lot_TjgEyzcSO3bGEzgj02DKGz70wKDNcvB.5a1hFz8oC48Eo8GxmFDkAJkk.2gEp1Heo
 3kAPzfFudaLoC9VhrkurdXSFHPQ_d.EtLRzZOKSNZMhNvjry2_pYNKGdMTSew8M5H5bsJTdVuKMt
 .MnQuq0dtvuPHBtiGlZZi_VK64bUqi8zKKBbBki6FfZ15y8zLjZZKNFF9NpREyHYH.AL4WPy5W7H
 ka0LUCFnPRB2_h4pKtNNPmsS46jM3wDg6Qtxw3VHYcFCOPZxEO_6l3p2Q6iVVcjGgheT9g2dk7mi
 FnBxG1E3rIq4.0B2CSLm74KNGqTlFQgRtdU.e3F6hnFr.wBrSD.pKC1vNdkQeLLJbC.SLZCHc5g_
 4jPZPrLSROn0av6.eJgWtw6N25UK0OhyhMKyZB1bKZPu7XC925rF4kXYHEK_P1SAU5_TT4THgpFu
 xssdONAV6aoS9tXVZ_SsUzPEEqrRXikGemh6CA3Dfblx2VWOtiYOyfVWa_dJ65ZYDeqmt8GmIjxb
 GWFpEHDs6vglrqVLzF.EFRA6kKrgvrJ2ysluXz4Y75rbUEIipadkTJn2PXJE8dEDD0DHlFFW5VBF
 __LeUB3c1BPMWCni9rwrjldiQyuGGhrHUq_Q6i2LDq5IBYSlynoFv8SoXyD2N4pAMZsZjQiWdnwP
 fKwAVQgfLtSPB.P5lIPAOQlZWsScTSyxb.zn6TZUEBLdm2_dqWXMih.YjfUoa86mfJ9ik5ZokKiW
 tdPnba9BsJYU_45Riuhy_vIpTtYMHXEbhDc1DCJfF3ob9dmdoZEoJfRKzxTMCQfEdyy6nWdy1rPA
 WCyA3xnNCcLMrx4C3JgoHNIDo9S9uZ0xHgJkRCF_xV0.EeX5JD32yKDC5yd3dY61SOTPjr8C8lPa
 mCjeAZQSMXCNzGnl1oyJoB03piIH1QZgW0psexO37qdFALmaOpMMIS4UcnsusNzsUTk7POuyWUaG
 JSw5NCSFQUAMcE1jKHkB6VYPGHi79AI5oof4xIMzT5S1Jwhsd5WHBmtvUaaCpT.t_k_JygZh3mNI
 anVGCxYFyo3JxSgAXRKYwfN8MKcV.NCxrwOwkkqQbgzad0xjTe8jr8tG2EsJ5eX9nuZbZ5ylHUBd
 l2yZXWMweggDJgiHtr_YtTy57jJwOMJtp3A3GEFZqHZcewYZpItACtzTAcveFHWt7JoE1XH314ta
 QDNt9_5dDmK80Kulu8oO2FoJiDAfhj1RyeNVxOMMbmCkSA6AG_IwMSnJA2HT2GD0mD0KZbQnJyMe
 FldotJNrUJq7cIvAlwsJL.uikta.PyQc6tLMi7DG3geluCPt1dYQBeuHK2LO0GNiBOCi1vPCH_.H
 yKuER.VJyPcexQxBN8nrdKRyZ3GjF_XB74u0PxS30P_Ve.mErIFghmSzFd0_yK15nXMNX9m6AFWG
 znHKlVY9kIrwcQ9Hdb9KiBfoVbYBWl4Z3nKshv.GMCG4urNZeXvtGg5wJPPB4WWbnjv0mlBPfivK
 TNDtrkk1Naj3WGTjLfjnC.ozk5avO6AB.wUQ.zByqUPssEKi8Bnz6Yov2.mbvNFj0mMW9R0CmJG2
 8wu4tSAZ.s0ByxXvB2gnEWLJnlGAc8XJr3DMH13_rnKRQdRNNNugxBbSIbmqJ3rKd256JFyF2DiC
 SGkDsuLij2nMbO.xPjCZlZGvg6D1e8mUCi7nIoWLHElbEzrsop6mf20v3lFLNEeh1mtGBKTPpK8I
 7BRxWrkxpnijofAf7ox85JptRwEjytJdXmEqQ7YgMmQFUSI1b10mar0zHh0jgqaE4prIahEiHRoE
 2hchdPyTjyxgMZtdp_.NBYVuRY81D2IdaTCD9PbTwiSTDaSlejd.k3abjhSb4.TC1gSJQcBNLBQW
 DiMVMQhC3PVMh4F6dGaDDNEp.AImEb7lNbPm.F0ZeeBGyXhtSXOzMSXWTQcH5lStkSs4UZOTct1Y
 t.0XIbN9j6H48BQhiKUhffjS2kQUIzFurR_IIApxnhywy02IYlLIQtBJL_TTrwdkZiln5hkFq6kh
 sPNIu9wxXCNNDf6RgAl_PK3FDlQaSil_gt6LBj6idUzeyZ.K15wjxr5rX.ixS3uCeaWUEvVEio.j
 GdarHEdhSiDPUClJIuI98h4Ic4TdGNeBxcQx5zLn9AcrIsTjwSD6OnxtNMSClV_ISlpakI8KKM3U
 .4M_8SeqAA7f7sWpLUrW90.22Dv217ZEDlchdkuelUGW45L2Q9cvgxPRUIlXiYMOgnMTDirR17vi
 bl_QA73iV43O50YjtSRY0NmRLalNzydylzjIkHMJo5XMtPf2vbDIy1Hk-
X-Sonic-MF: <race.my@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Tue, 25 Jan 2022 12:31:41 +0000
Date: Tue, 25 Jan 2022 12:31:37 +0000 (UTC)
From: =?UTF-8?Q?My=C4=87_Race?= <race.my@yahoo.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <1985233946.2970622.1643113897131@mail.yahoo.com>
Subject: Re: [PATCH v2] ALSA: core: Fix SSID quirk lookup for subvendor=0
MIME-Version: 1.0
References: <1985233946.2970622.1643113897131.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19615 YahooMailAndroidMobile
X-Mailman-Approved-At: Fri, 28 Jan 2022 10:24:41 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: =?UTF-8?Q?My=C4=87_Race?= <race.my@yahoo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



Skickat fr=C3=A5n Yahoo Mail p=C3=A5 Android
