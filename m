Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114456296BC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 12:06:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BDBD1678;
	Tue, 15 Nov 2022 12:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BDBD1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668510386;
	bh=3l46iiG2oDUmOgdG8bFfk8PCqHxBjXCFrRmAAo75HCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3Yl+bHJ01LUFPJCQMEC5gvijG0hgnpUCj9zSFSTVlopzQH0BeU8E+NeLkF5TDOe1
	 yUg8vXflGcVSOmVqrZp6RAdZ0QmnRUDN8W8xBiTG5LK5j638L6EBcLz1s0iJ9WEut9
	 qU8RD0yCkXyj3BsH+hvJvOcNu3dd2NN4QVtyJY6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C374F800B5;
	Tue, 15 Nov 2022 12:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C22F800AA; Tue, 15 Nov 2022 12:05:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC649F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 12:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC649F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="L2d+s6PV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AF7rHTp020835; Tue, 15 Nov 2022 05:05:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2x2KTIo3F9QQ0/tOccOJnv6JdTKJV/3DthcEWssm0Ho=;
 b=L2d+s6PVoTVuroXBYRCmzkcJuZVgfyVLo9/UwQ4I/KwGp5dLmwp4FURSp4jd208/cX/v
 +oy0WYgtbLzff+Q91hIZLWl32jeXAkdIZofG6lWK6S2Z1hJue48tBKFDvr58Ul/oXcdo
 uhU2W1wquzHrKPCvMaUtKfJl6Mm+Op/FMidlaAR5I9rDdzWsdi30OdEbxEpkWenYb6Bz
 yQOhn8LPw5bHjuV1WRA+tRrFRZ7C6ox9X7K3XtMA72rNZqATlCC0kcKPNXiXVLPFfKxQ
 gaIG6mkfdVlfmUlp7Hf6TBRWIGp0iPW2R6lgbdhOT+z4rPmmgfhpoidTaTvpWx7irSXV rQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kv6s7r5rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 05:05:22 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 15 Nov
 2022 05:05:20 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Tue, 15 Nov 2022 05:05:20 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8179646B;
 Tue, 15 Nov 2022 11:05:20 +0000 (UTC)
Date: Tue, 15 Nov 2022 11:05:20 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/4] soundwire: stream: Move remaining register accesses
 over to no_pm
Message-ID: <20221115110520.GN10437@ediswmail.ad.cirrus.com>
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
 <20221114102956.914468-5-ckeepax@opensource.cirrus.com>
 <9d701845-7ad1-046c-b7c2-dd2a131212c8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9d701845-7ad1-046c-b7c2-dd2a131212c8@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 2S5Z971K2I_ceiIg4jLzNBFZ4UNi9K9B
X-Proofpoint-GUID: 2S5Z971K2I_ceiIg4jLzNBFZ4UNi9K9B
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On Mon, Nov 14, 2022 at 10:04:55AM -0600, Pierre-Louis Bossart wrote:
> 
> 
> On 11/14/22 04:29, Charles Keepax wrote:
> > There is no need to play with the runtime reference everytime a register
> > is accessed. All the remaining "pm" style register accesses trace back
> > to 4 functions:
> > 
> > sdw_prepare_stream
> > sdw_deprepare_stream
> > sdw_enable_stream
> > sdw_disable_stream
> > 
> > Any sensible implementation will need to hold a runtime reference
> > across all those functions, it makes no sense to be allowing the
> > device/bus to suspend whilst streams are being prepared/enabled. And
> > certainly in the case of the all existing users, they all call these
> > functions from hw_params/prepare/trigger/hw_free callbacks in ALSA,
> > which will have already runtime resumed all the audio devices
> > associated during the open callback.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> I tend to agree with this one, and if this ever fails that would point
> to a miss at a higher-level we'd need to address.

Exactly my concern here is the core is trying to be helpful, but
really it is just going to be hiding bugs in the callers.

Thanks,
Charles
