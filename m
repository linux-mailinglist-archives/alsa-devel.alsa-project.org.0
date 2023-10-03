Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CE7B9B8A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EADCE7A;
	Thu,  5 Oct 2023 09:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EADCE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492311;
	bh=srL5i+/e0G3CukFOmGUtr7cVnpNzFbTFe9gkCTIdyWA=;
	h=Date:From:Subject:To:Cc:References:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQuP0qCovOJdBtviufJ7vuorQxZxfkkRB4F7ScIjdv86ok4JxfcE4G6Yta5VZHZKA
	 NpzL2oRCf3i3PsgM6jGGZ9I7Q25HJshr2RspuvZB1qi8aymkBOHBxYB91406mKlrD0
	 zVH3cut3Ug2Med23R9DUuxdFv2CwH8Q0aCfBiq0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7DD1F805AB; Thu,  5 Oct 2023 09:50:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDDCCF8058C;
	Thu,  5 Oct 2023 09:50:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7298DF801EB; Tue,  3 Oct 2023 11:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from abi149hd126.arn1.oracleemaildelivery.com
 (abi149hd126.arn1.oracleemaildelivery.com [129.149.84.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEA02F801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 11:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA02F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=augustwikerfors.se header.i=@augustwikerfors.se
 header.a=rsa-sha256 header.s=oci-arn1-20220924 header.b=cpgEdHA1;
	dkim=pass (2048-bit key,
 unprotected) header.d=arn1.rp.oracleemaildelivery.com
 header.i=@arn1.rp.oracleemaildelivery.com header.a=rsa-sha256
 header.s=prod-arn-20211201 header.b=QR2wy4jK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=gEeJIPzvzVkyH+NRCBLOt631AmVlDSMa/1+fcXZ5V4I=;
 b=cpgEdHA1ORayguhDshh9wTP273qjpW9M1AEv2E4g4Cl29ZWg5r1mH2yQZiv7bvza4jtei32plCuz
   xrOp+y2PRzTxz4ohLM1vEH8wFD7AO190Pg3f2pGTinv0QTjeLyndsdouOPzSBaGPwL2+wRq+BXDE
   y4Vkjq/Ua7LsrUj0zbPb3DHvAp+3OqhmJrOBGBff28PdGfH5TRGZ62rXowuO0Hh4xbjxXAXJjLpF
   Y2lf5pA2rroTKih3DTlZLT4zjZMbJVPWzjRW2X4PyqyKS03F7VWy9Le/qS+RUXqhYT/usiT/7bX1
   LsWmHf/zbMQfsfEhZhlHdkvEULO4k9PlZAFCQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=gEeJIPzvzVkyH+NRCBLOt631AmVlDSMa/1+fcXZ5V4I=;
 b=QR2wy4jKD7aeG2qoZH9lOmWHQ2qKOYh6omKF8BbKgeRMdqEvCNxLyNobAysrmGW/SnAxnI1mBQfa
   3RvVg2Pbi3uwsZiuke6f0B+DfFXV0FkBqQRAZAIgLuwkihb/xZPnciLaK5eofpaK9AJBJbYXbcu2
   DY4JbAevTRD7GbnWeYSEgMAt2tUtBNjnfJbPynzBtUXpVX+plz9TYpmiGx5e607kBYlTZlKj9uQ/
   Na9wLkhQD8u6J3iUGuKhilCT2h+onXyjwNwWWI13gR75V5F/Z0bzWs6IJ7JobxsgfRv6l1dYyDDf
   uVu/8kbCekfc4QJGJs022DR+HpvO23OebZMZlA==
Received: by omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id
 <0S1Y007FC5H7XO30@omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for alsa-devel@alsa-project.org; Tue, 03 Oct 2023 09:39:07 +0000 (GMT)
Message-id: <99eb37e0-5ade-4137-93d5-901f598f4082@augustwikerfors.se>
Date: Tue, 3 Oct 2023 11:39:04 +0200
MIME-version: 1.0
From: August Wikerfors <git@augustwikerfors.se>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo Yoga Slim
 7 Pro 14ARH7 82UU
To: Markus Meier <kerneldev@epic-bytes.net>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, regressions@lists.linux.dev
References: <10347605.nUPlyArG6x@kali>
Content-language: en-US
In-reply-to: <10347605.nUPlyArG6x@kali>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta: 
 AAHPA+lGEgh+LcklqCHZGU1AP61IUJVJAlVMR4F30wXN/+sMVQlUrFG9qeJ7+B13
 94A63Ql7MW3ThyqPcApzRL3tvPxJ5j49hsFWXrSEtKfjZLuMK3RFX5OY6W9lZ/eX
 pIlSjtmgyIO+BFcKYkmT1p3M+v1CJkdwxYeXTi/gVE6/r7NELHFlJ5ad8SOhxdKq
 Xbra2yBh136OOf4H0MUmlqt+GsA/vcdQJ8X1HvM/TjJmBiXFuwHTtCCcnnCLbKwk
 ONB+CbfOXipgQRvMbA/xrJNf4R1HRVmTYpWCFwa4JQaZoBpvrJgAqtwDqrNVl/8J
 OR50CehqFbvn3pkP8jeI6+BsphV0QYk7EtYw9BW36urgFkbWm3F+ijqTHuSG3zQT
 FHYGph8dAR2OX97+ZJRTW7fWUbJSiZi+I4dtloba3bUDtCpd3YqCXmH0qDXD5uyO BeOjrw==
X-MailFrom: 
 bounces+alsa-devel=alsa-project.org@arn1.rp.oracleemaildelivery.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UEQXJEWYYP5HHMTIMG2AUGH3IXYJQHF6
X-Message-ID-Hash: UEQXJEWYYP5HHMTIMG2AUGH3IXYJQHF6
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:50:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEQXJEWYYP5HHMTIMG2AUGH3IXYJQHF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[+Cc Mark, Mario, regressions]

Hi Markus,

On 2023-10-02 23:04, Markus Meier wrote:
> Hi,
> 
> I own a  Lenovo Yoga Slim 7 Pro 14ARH7 where the microphone is not showing up.
> I added the system to the quirk table and the mic is working correctly (but
> with very low volume) now.
> 
> Here's an except from dmidecode:
> System Information
>          Manufacturer: LENOVO
>          Product Name: 82UU
>          Version: Yoga Slim 7 Pro 14ARH7
>          SKU Number: LENOVO_MT_82UU_BU_idea_FM_Yoga Slim 7 Pro 14ARH7
>          Family: Yoga Slim 7 Pro 14ARH7
> 
> Please add this patch to the kernel
Please read [1] for how to properly format and submit kernel patches. In
particular your patch is missing a "Signed-off-by:" line and it should
ideally be sent inline instead of as an attachment (it is strongly
recommended to use git send-email for this, see [2] for a tutorial on
how to set up and use it).

Also, since this fixes a regression caused by a commit that has been
backported to stable, see below for "Cc:" and "Fixes:" tags that should
be added above "Signed-off-by:" to ensure the fix also gets backported
in a timely manner [3].

> and add it to the stable kernels too. I
Cc: stable@vger.kernel.org

> guess the microphone should have worked before. Seems to be a regression
> introduced by c008323fe361bd62a43d9fb29737dacd5c067fb7
Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[2] https://git-send-email.io/
[3] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#what-s-important-when-fixing-regressions

Regards,
August Wikerfors
