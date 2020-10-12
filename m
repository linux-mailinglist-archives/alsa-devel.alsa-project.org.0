Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6DD28B185
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 11:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511F31668;
	Mon, 12 Oct 2020 11:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511F31668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602494889;
	bh=n7x4K+AAnGTxtNHiHYOiF6yCKOeKqfHy35dHy4+KC+4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWIsR9BHF1lw8XAZRA6UlEuzG756Heviws2F9wgRqJ0TQrupR0CDqZ2+qnZGr6b7v
	 QwjAwIYEmhy4UyLzpX2TAIjxfmLz5WJthqYf4ZzVWAkj7AvIFaK45ZV9g6hFGy6UuR
	 6CDooiaZklEaAiNxeGcNREY7sQ8MCwP/XCnK3GPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB3F6F800F6;
	Mon, 12 Oct 2020 11:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C903F80217; Mon, 12 Oct 2020 11:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0629F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 11:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0629F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Fr6ntnT4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09C9CwDG024527; Mon, 12 Oct 2020 04:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=npR59MT2okLFRihK1aLaXqrPn+4KISI//u1QyKT9TAc=;
 b=Fr6ntnT48Ah75d/z1b7ivhuM1K92TlC9Bu2kSu0DF9J+lZivSy/eA6s1ACKD4FipDzIN
 hisNAfvJq9zRXYfxcRUCftXobLqJZcx/FcpS2TyW7VWBRNzOewpoARHFNkRpuDEnM8Y6
 BsHShBwQNxE5XrDFkwK4AIIliVmsg5E3RNFM+DX5JoGEVDsmTJJeSbzgIfv3kiFh/QLd
 XkpsNHhkOpzqvShg9oPADM2NHl8fPqI4MC4z6a/RNOatlNLxFfu2fnvp3TjZqgOGU/Gp
 FWQEw+onFBm063FTGC32BuSWucIFXfZQVDOttWwpnHV9GCmC5XkD7u6LRUlzp1FQyPhX kw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac1t3uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 12 Oct 2020 04:26:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 12 Oct
 2020 10:26:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 12 Oct 2020 10:26:18 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 659A82AA;
 Mon, 12 Oct 2020 09:26:18 +0000 (UTC)
Date: Mon, 12 Oct 2020 09:26:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 1/8] ASoC: wm8350: use semicolons rather than commas to
 separate statements
Message-ID: <20201012092618.GY10899@ediswmail.ad.cirrus.com>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
 <1602407979-29038-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1602407979-29038-2-git-send-email-Julia.Lawall@inria.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=717 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120079
Cc: alsa-devel@alsa-project.org,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
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

On Sun, Oct 11, 2020 at 11:19:32AM +0200, Julia Lawall wrote:
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
