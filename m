Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A131458184
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Nov 2021 03:29:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FD5170B;
	Sun, 21 Nov 2021 03:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FD5170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637461739;
	bh=5B1tygrNXNV2A61CLamHESeJzyho+jTUiZ+gyVHVWpI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F57viwhEGhg6E5Rt7puuISgeVRpr+0alSIs9MSbpXf6489az4DQauBXmUDqCfywIh
	 5F1v9P3k8hvrI0H9Pj9yqgcFDz2rEMdFqDjm1THjxduRSlVAm+PdlwHZXi4dvgte9Q
	 uIaaAAg3up2UZO4j7556sxSMw0t7bF1e3OtU5XbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6FEDF804AB;
	Sun, 21 Nov 2021 03:27:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFEF1F8049E; Sun, 21 Nov 2021 03:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7DFF800E7
 for <alsa-devel@alsa-project.org>; Sun, 21 Nov 2021 03:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7DFF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VUzwKFp8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA6DA608FE;
 Sun, 21 Nov 2021 02:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637461630;
 bh=5B1tygrNXNV2A61CLamHESeJzyho+jTUiZ+gyVHVWpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VUzwKFp86nAlK71IbLniCYP89vvzsMV6E10zFllboFOa0bb9tNs2vCa2ap3LX2bTK
 e6REB7M6xS5aWrBAXPI5XNFr3B0LZ1A1fbT1CpxsPfZMgQ9PvmdGmzyelK/6yAm0iB
 PiQgYUJ7Lwjo7iYH3VfYtyepzJTLdCfiEMWgBfX8s61fXOrKDdo+Plm6i4yTuZ9DcA
 n2IzQCIuw+FsUeWEHldQMOrYZLKA9/G4zfCS1KmXbhnrIR6edTuqpTLOsx4LffpehB
 aar/+hpZsHZf81VBSJuvXcj2QVkldV5iYyA2NiXY5tY7G27H51pdAwKWoo0ybcp96J
 RkAxd0eZlbaZA==
Date: Sun, 21 Nov 2021 10:27:04 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] arm64: dts: imx: imx8mn-beacon: Drop undocumented
 clock-names reference
Message-ID: <20211121022704.GF31998@dragon>
References: <cover.1634565154.git.geert+renesas@glider.be>
 <16af1bd2847da8b2a265e2a4389942ae11dea7c5.1634565154.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16af1bd2847da8b2a265e2a4389942ae11dea7c5.1634565154.git.geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Mon, Oct 18, 2021 at 03:59:02PM +0200, Geert Uytterhoeven wrote:
> The wlf,wm8962 Device Tree bindings do not specify a clock-names
> property.  Drop it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.
