Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6AA660842
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 21:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E293D14287;
	Fri,  6 Jan 2023 21:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E293D14287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673036747;
	bh=+AtIr4tkDXhCceor64nJXGDuX/DDFyU6LzAmD7IDWhE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jjbV2hZAo+hK+4irxC9wM5a9oRT99QjEdiBGYk3G5TVidK4rFT/tLgVDvJd/dmgyF
	 T6hLqhT4b6/ebpllZGde3ZlttOoSOKPzTY2+YwGlRfK2fF6pPm8M2ZXY8BSnXbkyVq
	 rMciNN6t0+c2B/uSWB3U6yx4RuzErV3Q/d83b5NM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1347F80217;
	Fri,  6 Jan 2023 21:24:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E9AF8022B; Fri,  6 Jan 2023 21:24:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28188F80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 21:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28188F80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pgGP1CHv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8B644CE1E21;
 Fri,  6 Jan 2023 20:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55460C43392;
 Fri,  6 Jan 2023 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673036661;
 bh=+AtIr4tkDXhCceor64nJXGDuX/DDFyU6LzAmD7IDWhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pgGP1CHvYam7/NYiXpKZY1EGzyZZzTD2i/y0diozAU4aMhv0Oa7DJyFr6VeETj4R3
 jcVGryikHlwtWOC2Jjr9tuYqasFZ7K0R4A2zBm+nmr0ZfvR5YSRUe6yv6QSiktItII
 MHGPPGLnWjd4Oc0jV5VY9enZ7Hpsq1OgDBnX74XGJGBTUhwpyJUUjeEP8ZS7pPVhn0
 qrsEJ/GDUgu0F+ABMnLT6DOwSunUnNRYkTzdYWnIN896iXXFbwIN+gLH8bhdII8r8g
 Yfj6AnT4HAGlXbdhMvKmPz5sfmRLpNR1OZxloip08yUqBENZrYWKPkdN2/CeXwZRts
 kQDU5NX+PaL9g==
From: Bjorn Andersson <andersson@kernel.org>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	set_pte_at@outlook.com
Subject: Re: [PATCH v2] soc: qcom: apr: make remove callback of apr driver
 void returned
Date: Fri,  6 Jan 2023 14:24:17 -0600
Message-Id: <167303665351.1802272.14996643528670691763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <TYCP286MB23232B7968D34DB8323B0F16CAFB9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB23232B7968D34DB8323B0F16CAFB9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 6 Jan 2023 23:28:03 +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return void")
> forces bus_type::remove be void-returned, it doesn't make much sense
> for any bus based driver implementing remove callbalk to return
> non-void to its caller.
> 
> As such, change the remove function for apr bus based drivers to
> return void.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: apr: make remove callback of apr driver void returned
      commit: 33ae3d0955943ac5bacfcb6911cf7cb74822bf8c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
