Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAA48DB20
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 16:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882441FB6;
	Thu, 13 Jan 2022 16:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882441FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642089244;
	bh=P52WAOzIEOYbb9jr6942W/v98vIc3pyEjtYLPP1TiSk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FE1+QZ9r6tbHeC9KsNz50SBlnZ6VxilpdVNGtqQZyKYPvWgeoj7CjMD9g5/zO3u0Q
	 WjouDxq38PDGSAXKOc9J1KifnjzP/mhmr1yjznMIw0ChNDo4rradMKv6ifV9zYMYiE
	 CLSUlCSEJWafiLSZWX0PtjgBrxl+XNBBQArxHhQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1B0F80141;
	Thu, 13 Jan 2022 16:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79A07F8013F; Thu, 13 Jan 2022 16:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D220F800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 16:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D220F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AAI8iCsX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D7TDuT015302;
 Thu, 13 Jan 2022 09:52:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=3eTAYHBuhkXwQz8GvoKIzHu0Qzy8xDbMNp5+VdUW3zk=;
 b=AAI8iCsXQITSaMOXUqVVhEiEw/fqjtjbbPiPdS+szivZVOlqq41wNxroy4/J+hveNKJy
 FQ96juaehR22MAGPU1yB1zb0uJ61VFU7uU9fQ6lCsZKUphhe8SqU+ff8rRR5Sifvb4B5
 dxGeJglcIXmTfPdkzIEytQVhGM+WxaxBCl1yxhcJ3wpj4yO0MoDEUdh1RKjB7Ky93dLV
 L13WwAvd+Iy41e2YAB0wReBGHI8z5n0DW8DwX6I9FQ5wwOFwNLQlwXKGIp0p/vpNJKA9
 mk4Q/g9QQvLCfMCZBZiZDVC3w+CxrjF5lZo5TM4L5HZKbybm3yhPUTgTGlo2wU7A79vo CA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dhejy26sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Jan 2022 09:52:45 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 13 Jan
 2022 15:52:43 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 13 Jan 2022 15:52:43 +0000
Received: from [198.61.65.50] (unknown [198.61.65.50])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE79CB0E;
 Thu, 13 Jan 2022 15:52:36 +0000 (UTC)
Message-ID: <bfe7b97b-4ec9-13a0-aed4-e15d18b03df3@opensource.cirrus.com>
Date: Thu, 13 Jan 2022 15:52:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: <tanureal@opensource.cirrus.com>
To: Cameron Berkenpas <cam@neo-zeon.de>, Stefan Binding
 <sbinding@opensource.cirrus.com>, 'Hans de Goede' <hdegoede@redhat.com>,
 "'Rafael J. Wysocki'" <rafael@kernel.org>, 'moderated list: "SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM...'" <alsa-devel@alsa-project.org>,
 'Liam Girdwood' <lgirdwood@gmail.com>,
 <patches@opensource.cirrus.com>, 'Takashi Iwai' <tiwai@suse.com>,
 'Mark Gross' <markgross@kernel.org>, 'ACPI Devel
 Maling List' <linux-acpi@vger.kernel.org>,
 'Mark Brown' <broonie@kernel.org>,
 'Platform Driver' <platform-driver-x86@vger.kernel.org>, 'Linux Kernel
 Mailing List' <linux-kernel@vger.kernel.org>,
 'Len Brown' <lenb@kernel.org>;
Subject: Re: [PATCH v6 08/10] ACPI / scan: Create platform device for CLSA0100
 and CSC3551 ACPI nodes
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-9-tanureal@opensource.cirrus.com>
 <CAJZ5v0jTELqFeO6q6w_mYNo_yf1R9SX66RrEz0ZSe27w7E6kog@mail.gmail.com>
 <4b5506b1-20c6-3983-d541-86dc2388b2a7@redhat.com>
 <004001d7f5c6$7329d4d0$597d7e70$@opensource.cirrus.com>
 <e2d39d52-c139-a94a-94cc-88841d3638e3@opensource.cirrus.com>
 <3f042293-05de-d472-dd6e-ce5ca3a8331b@neo-zeon.de>
In-Reply-To: <3f042293-05de-d472-dd6e-ce5ca3a8331b@neo-zeon.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hoxzO8VJxXFJMNQMRsDgldZyIoHMplz3
X-Proofpoint-ORIG-GUID: hoxzO8VJxXFJMNQMRsDgldZyIoHMplz3
X-Proofpoint-Spam-Reason: safe
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

On 1/12/22 8:00 PM, Cameron Berkenpas <cam@neo-zeon.de> wrote:
> Hello,
> 
> Will this also include adding support for ID's matching CLSA0101?
> 
> Thanks,
> 
> -Cameron
> 
> On 1/12/22 05:05, Lucas tanure wrote:
> > As the ic2-multi-instantiate patch chain is still being worked out, we 
> > would like to submit a new chain for CLSA0100 id and a few fixes for 
> > the HDA cs35l41 driver.
> > And to avoid conflicts the ic2-multi-instantiate patch chain will wait 
> > for this new patch chain to be merged.
> >
> > Thanks,
> > Lucas Tanure 
> 
> 
Hi, 
We have the plan to support CLSA0101 in the near future, but not for this current patch series.
Lucas

