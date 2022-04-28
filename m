Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D467512F31
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 10:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249933E7;
	Thu, 28 Apr 2022 10:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249933E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651136333;
	bh=Gi8HN6KD/yJRYYiCF7hA6p2zoK1UZOU1l6WXedQ4Ogc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kD92K5W2Iao4piBKuyQunc6n7TSSZ2CNHx0jxvdnLv3dj9qeNOmUlHxtTjz4VKYqV
	 pQ5n/DgUXVhtSxWKJKI3qavXOgeXY68VyPUeQCOeCg5fONyYPtFes9wa5F8GlTBot4
	 ohrGaqEjchHOTuS8+jCc8cBJjGStTyH4VPjzq4nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CE36F80311;
	Thu, 28 Apr 2022 10:57:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D04F800F2; Thu, 28 Apr 2022 10:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64C0BF800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 10:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C0BF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZrlLZuEJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S84mPF013671;
 Thu, 28 Apr 2022 03:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=lw4vPSC0Sg0RRx2v5dzNrqFzM/Hz4CzUnSZ52Sl0ZFk=;
 b=ZrlLZuEJLYh3LDQMwQVXkACvFBpiZn0Nez6BlpPvrug71GuV5HqLT3v3zpCSGfWZ3L/P
 QvGl4loqSYW55Qtbaq5jAMugtpwgTZeK7x1Kyt1eQ/F3P6mvtsmzyGnUMCtgSGPsSwFn
 bAhoxDmRuOZ34SSkznzSgeXloYcA3DTNHrifkQxV2El7zYYi4N7dHwJNymH4ZcA64Cwe
 hLuLQ/V2KAvfcl+JT9H3qebXSFUwPuijEtNQX9a8hSFGACOd/b08zUhImg3g07/+u52J
 9N8AAqJGGCakLD5B/iBQhN6YJqrIHUbeFMJ4q+o0JHb9i5dHgK7H2kYF3k4YYUnUe1vZ ZA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt61vr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 03:57:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 09:57:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 28 Apr 2022 09:57:40 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DDDEE46C;
 Thu, 28 Apr 2022 08:57:40 +0000 (UTC)
Date: Thu, 28 Apr 2022 08:57:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH 06/26] ASoC: cs35l41: Move cs35l41_set_cspl_mbox_cmd to
 shared code
Message-ID: <20220428085740.GK38351@ediswmail.ad.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
 <20220427150720.9194-7-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427150720.9194-7-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: EUz3WwI3f4dQHnV4upV0JBtdt1_0x9G7
X-Proofpoint-ORIG-GUID: EUz3WwI3f4dQHnV4upV0JBtdt1_0x9G7
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Apr 27, 2022 at 04:07:00PM +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> This function is used to control the DSP Firmware for cs35l41,
> and will be needed by the cs35l41 hda driver, when firmware
> support is added.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
