Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEA4E973B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 15:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB861836;
	Mon, 28 Mar 2022 15:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB861836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648472481;
	bh=IbmFDwzNl28I9V2wOdmz3kTgsYB394WCzCFQg2IAyGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jnYkKYgG4MMiSFgdE9TIDcXxiU5ZsRADxWOEPR6J4wGbyOXZbxn8qnOuOowml/Od/
	 jelIxIt6TeWopZfqMqyugJptWUghEAtV3b28zWxhlNo4m9ubYfFlEyeL7wSC0UVQm9
	 uHq9/90SaLwPZZm+48YGu1S0wOobZmXLlamIqnQc=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CB3F800FA;
	Mon, 28 Mar 2022 15:00:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0949EF8024C; Mon, 28 Mar 2022 15:00:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F10A8F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 15:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F10A8F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UpfNagt8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8bmMQ011867;
 Mon, 28 Mar 2022 07:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3sH1PxPR22yc/WJy0GaNJLuPKMMrFQ7JiG95F/CyMD0=;
 b=UpfNagt8N7Jlk9+dNZylsIEa7dLrOCuforAMcrxMe9yAPKhNsi4BOUuNPjzMYcC825+x
 cSYGwZ2gKe1KnL3+ovOAjt2CwprBt4GRMnwaTTHY74fYBXfQ/TwXdksGkk3TMMnNUGb4
 WhwtV5spFjqgmp//xrEUMHC/dczKpQfRjFEeuPsd4Y2+IVBYJ3n2iHyfgknzh5HFs5xY
 dVXySE+pKXXSbh+zgh22laHaMVJcyaPcprZukWSUNVJcNc3w8FZUCBIzbJy7hi/NjOka
 3X5trxHOYWEFPVGiL8npbzLtgS1QbbXUl9sCsZJcbM3A5CwpXfzefiGHFbnyNuJiaOHY aw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081arrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 07:59:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 13:59:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 13:59:56 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 559F546A;
 Mon, 28 Mar 2022 12:59:56 +0000 (UTC)
Date: Mon, 28 Mar 2022 12:59:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: Add one more variable in the debug
 log
Message-ID: <20220328125956.GG38351@ediswmail.ad.cirrus.com>
References: <20220328123535.50000-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220328123535.50000-1-hui.wang@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: vuNqV1Zq9UKYnV15w2tZfHH7pabYE8K7
X-Proofpoint-GUID: vuNqV1Zq9UKYnV15w2tZfHH7pabYE8K7
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, tanureal@opensource.cirrus.com
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

On Mon, Mar 28, 2022 at 08:35:34PM +0800, Hui Wang wrote:
> otp_map[].size is a key variable to compute the value of otp_val and
> to update the bit_offset, it is helpful to debug if could put it in
> the debug log.
> 
> Reviewed-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
