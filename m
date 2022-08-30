Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA95A5EDA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 11:03:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA6721692;
	Tue, 30 Aug 2022 11:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA6721692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661850207;
	bh=U4o/VpPZ6hvLKtB9knI1IDw4TNpOhNuHR49xPxvgdTc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=myWjJ7USC/1Fs1b9eh1WLZDpnVfTfkVunBlb8fDvlYro7wK22UdZC62V7SJNRyHF1
	 lzV0wFcrzzP5uKVBD3+XNzBZKhWL1Gssso+t5xTjwyCrOBJoJDClcTvWmi4Ah9nSgQ
	 J5j73t57i9rpXNbQZG54Z3RJFVFnhovJn9TThxoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C68CF8032B;
	Tue, 30 Aug 2022 11:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 612A6F8023A; Tue, 30 Aug 2022 11:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E998F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 11:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E998F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jvdfEASy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U6Pxh5022426;
 Tue, 30 Aug 2022 04:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=V3JwjUYaG9//thPC4BpkFa4sbgYWP5F0GzkhlFPquZQ=;
 b=jvdfEASyU4UXTzp4w6xu8HKKXzcfqcLG2X+fVA52ElRbAiESJJil/D043us5JqGoWHoD
 fFjfn0/KkOYkcIL7eoSAsy1du0Z+c80QnD5xtWgXzuwM+Mr4X8Hl0jnUFlvJ3dDupGJJ
 7oxtQHxMf3Q4/C+C51GrsByRNFado2tZyisBhw25HAMv1QefDNUaXFZESuwPHRqqzV6+
 ZcvUzgIfJHaA6Lc8/lFaPwGreROS/vZsVmzdZSHUPldp0L5od5cgoXQ4y6vCXA4CVy8w
 Jcc7QYcY+t8zxTIQE8XKgJsmyRx4kdc7McTWoEagKHEED2c+n2zoLAan7GqIJxvoxco6 Ow== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3j7gp233mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 04:02:17 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 30 Aug
 2022 04:02:15 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 30 Aug 2022 04:02:15 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6926F46C;
 Tue, 30 Aug 2022 09:02:15 +0000 (UTC)
Message-ID: <40352b26-97fb-374f-dd3d-52e241399dfb@opensource.cirrus.com>
Date: Tue, 30 Aug 2022 10:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/1] soundwire: bus: Don't re-enumerate before status is
 UNATTACHED
Content-Language: en-US
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
References: <20220829094458.1169504-1-rf@opensource.cirrus.com>
 <20220829094458.1169504-2-rf@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220829094458.1169504-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FpYuGQwy9hoEBeNCqTnUoXKZwco1UU_K
X-Proofpoint-ORIG-GUID: FpYuGQwy9hoEBeNCqTnUoXKZwco1UU_K
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 29/08/2022 10:44, Richard Fitzgerald wrote:
> Don't re-enumerate a peripheral on #0 until we have seen and
> handled an UNATTACHED notification for that peripheral.
> 
> Without this, it is possible for the UNATTACHED status to be missed
> and so the slave->status remains at ATTACHED. If slave->status never
> changes to UNATTACHED the child driver will never be notified of the
> UNATTACH, and the code in sdw_handle_slave_status() will skip the
> second part of enumeration because the slave->status has not changed.
> 
> This scenario can happen because PINGs are handled in a workqueue
> function which is working from a snapshot of an old PING, and there
> is no guarantee when this function will run.
> 
> A peripheral could report attached in the PING being handled by
> sdw_handle_slave_status(), but has since reverted to device #0 and is
> then found in the loop in sdw_program_device_num(). Previously the
> code would not have updated slave->status to UNATTACHED because it had
> not yet handled a PING where that peripheral had UNATTACHED.
> 
> This situation happens fairly frequently with multiple peripherals on
> a bus that are intentionally reset (for example after downloading
> firmware).
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>   drivers/soundwire/bus.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index cb77da84a4f9..a3d3d66b3410 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -766,6 +766,13 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>   			if (sdw_compare_devid(slave, id) == 0) {
>   				found = true;
>   
> +				/*
> +				 * Don't re-enumerate a device until we've seen
> +				 * it UNATTACH.
> +				 */
> +				if (slave->status != SDW_SLAVE_UNATTACHED)
> +					break;

This should return. We're going to keep seeing this peripheral as the
next to be enumerated until we program its device ID.

> +
>   				/*
>   				 * Assign a new dev_num to this Slave and
>   				 * not mark it present. It will be marked
