Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724849611B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 15:33:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04CC2AA5;
	Fri, 21 Jan 2022 15:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04CC2AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642775626;
	bh=oTjVkcPkkcm4bAnyoZb5IuHZAVHYOOxKFX4P+ut5fJM=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pzfCKClgj6zLawSktR19L4idPPP7CQ/yECvcqGN82MpFbgnl7gkQ/Yz+ADy2D4rTF
	 wN+ddZMt4LPcRBYieovu5a/xPejAOiBMwO0rzD8EHRy4CDQQFNsL8iw+HqwJdZTZKT
	 iYCw16dvzGK6M8tK51CWmWMwB/mtBwVqHKxzxsaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3229CF80302;
	Fri, 21 Jan 2022 15:32:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC3FEF8028B; Fri, 21 Jan 2022 15:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B3CF800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 15:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B3CF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RsDflDrf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L5gDLg030246;
 Fri, 21 Jan 2022 08:32:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=JCEvGSRutgn1zFC3u9mSgqGgE4vlOvz4fCTu56u3JTw=;
 b=RsDflDrf0XKHqhNTAJC8VW6MOGUpJBRGBBh2UiiBPkQRMD3ueYK1Vcba06/BBum8ElR3
 fQZX7LJ/Am6NMoTGiiyfjPkv0dwb7w+OqITwLzR1mtACfXiz9Pwl5YBVoa/VhUyokQM0
 2nZLPinVN4ZAjNUcG8KqV5K2S423cMJJ1XPwILGeruJ+E1gHUPjwUAHu9jLUqK/Fly9q
 UcWGN2izxYj/WgkdaHEVABi/rW+rfJmQqLyxaJkFAzz4XiIUP+6DofZW548h7fPaPDna
 EsRoQty6yoHrf8OX5qrjJQJ/NhR1yOyz7ahoEhVRmCM9z3p7JgLCgTR6OPMZs+zgTgFD eA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhynrnt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 08:32:27 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 14:32:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 14:32:25 +0000
Received: from LONN2DGDQ73 (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7133F45D;
 Fri, 21 Jan 2022 14:32:24 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Takashi Iwai' <tiwai@suse.de>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-9-sbinding@opensource.cirrus.com>
 <s5ha6fqtokp.wl-tiwai@suse.de>
In-Reply-To: <s5ha6fqtokp.wl-tiwai@suse.de>
Subject: RE: [PATCH v4 8/9] ALSA: hda/realtek: Add support for HP Laptops
Date: Fri, 21 Jan 2022 14:32:24 +0000
Message-ID: <018c01d80ed3$b5a5a610$20f0f230$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFrharyhx4ySa1JB46MXi1N1GyrjwJH3znKAcNcDSGtJkEkwA==
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: sOEA562_2qwbgUYCx1ispTGtLe8T2Ttx
X-Proofpoint-GUID: sOEA562_2qwbgUYCx1ispTGtLe8T2Ttx
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 'Lucas Tanure' <tanureal@opensource.cirrus.com>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, patches@opensource.cirrus.com,
 'Takashi Iwai' <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, 'Mark Gross' <markgross@kernel.org>,
 linux-acpi@vger.kernel.org, 'Mark Brown' <broonie@kernel.org>,
 'Hans de Goede' <hdegoede@redhat.com>, linux-spi@vger.kernel.org,
 'Len Brown' <lenb@kernel.org>
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

Hi Takashi,

> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
> Takashi Iwai
> Sent: 20 January 2022 15:27
> To: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: platform-driver-x86@vger.kernel.org; alsa-devel@alsa-project.org;
linux-
> acpi@vger.kernel.org; Lucas Tanure <tanureal@opensource.cirrus.com>;
> Rafael J . Wysocki <rafael@kernel.org>; linux-kernel@vger.kernel.org;
> Takashi Iwai <tiwai@suse.com>; Mark Gross <markgross@kernel.org>; Hans
> de Goede <hdegoede@redhat.com>; Mark Brown <broonie@kernel.org>;
> patches@opensource.cirrus.com; linux-spi@vger.kernel.org; Len Brown
> <lenb@kernel.org>
> Subject: Re: [PATCH v4 8/9] ALSA: hda/realtek: Add support for HP Laptops
> 
> On Thu, 20 Jan 2022 14:43:25 +0100,
> Stefan Binding wrote:
> >
> > From: Lucas Tanure <tanureal@opensource.cirrus.com>
> >
> > Add support for two and four CS35L41 using the component
> > binding method
> >
> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> > Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> I guess this patch won't be applicable until ACPI or other tree syncs
> with the latest Linus tree or sound git tree.  Must this patch be
> merged with other patches?

In order for these laptops to work correctly, it will need all of the
patches merged,
including both this change and the ACPI changes - without the ACPI changes,
some of the amps will not probe.

Thanks,
Stefan



