Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9143942C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7E211686;
	Mon, 25 Oct 2021 12:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7E211686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159242;
	bh=BH/r4t7XUfXalF1aze9Lgyj/MFNpB1WHSxy9BPpB8B8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YEsugmgYJyMhnM4+gW6M2w8PENwNbaIKqckviarI35pDwmGZOiSFIG6ieLv5wL/i/
	 sL1iR+XW5fAukwbwmqLQ52RaapSYeOc/PiX/U7zhx6D7jVwKtgu7ROUZOqvaLfr+mC
	 s7zCaHD1axQKiKBDsU9pbExwBiNkeLD/E7RbhZTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB9FF8032B;
	Mon, 25 Oct 2021 12:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33DBCF8027B; Mon, 25 Oct 2021 12:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4AA5F80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4AA5F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fLMuPgOZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P5nh0V025457; 
 Mon, 25 Oct 2021 05:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=COzU+DyRZ9QkDqJIWvOLk8FKEQMEKdMfeXVfd1Ev01k=;
 b=fLMuPgOZ0zXJRCAc58oQ5LiLp+vaB8/3kbIW4XSexBhS8dJfdjxW8hv0HxumF677jPUU
 h6g0Ak9GHQeL2wVF5A5Vp8/mLECNClBDj3FwV10o9vn0BS6eNbXV0CEaTex/hoCwXSLM
 OOk3OJ5cj1Zg0Fq72uqETJi0/MOQ5haMWubzVbbAg9gTNMzxEpcA+zrJ5S+yJRhQ0mG4
 KBl44aEa5OAgasIbxR/W+giC3gthwGjgN+wF4VKq8D9mGehfBfSfFjJd+6jVjCQ3Xwwt
 5nNgYXWlOyj7IulbRfON3P4rzh/d7+qeGDYRpEY7Ykxdxq594ptm3lmpFWDch8z541AD hg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bwn2mrasg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Oct 2021 05:52:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 25 Oct
 2021 11:52:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 25 Oct 2021 11:52:21 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ACF3811DA;
 Mon, 25 Oct 2021 10:52:21 +0000 (UTC)
Date: Mon, 25 Oct 2021 10:52:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: wlf, wm8962: Convert to json-schema
Message-ID: <20211025105221.GC28292@ediswmail.ad.cirrus.com>
References: <cover.1634565154.git.geert+renesas@glider.be>
 <b0868d2f62fd57499c79d96298e99e5f9e4fbc76.1634565154.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0868d2f62fd57499c79d96298e99e5f9e4fbc76.1634565154.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 9Ynasz0jTxbC0NQ4gREwOUEo3ICyj2O-
X-Proofpoint-ORIG-GUID: 9Ynasz0jTxbC0NQ4gREwOUEo3ICyj2O-
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Adam Ford <aford173@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Oct 18, 2021 at 03:59:03PM +0200, Geert Uytterhoeven wrote:
> Convert the Wolfson WM8962 Ultra-Low Power Stereo CODEC Device Tree
> binding documentation to json-schema.
> 
> Add missing *-supply and port properties.
> Update the example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
