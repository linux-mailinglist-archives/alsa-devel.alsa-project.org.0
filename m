Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C549B4C3038
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 16:46:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F301AB8;
	Thu, 24 Feb 2022 16:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F301AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645717616;
	bh=PzX96kduRIYE/gKPsTNuQPtzkDDYW6yJR2z6E96mZSY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPy9hcTM5VQZaOp7YtbiexEh3RSNvJ3sbXOKDYcwh+8nGPyRLFTmHaULkS5CfL8VJ
	 NUfCtMKjiIwS77smsiqEUhU6M9q1KXLjztIJ/3za+c2YWBLs7qK526Ynp7HGON6+KE
	 +hWdQpnIZFxDmS4yIwz1IXlq6VWNJB/xlIUnsIhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3698BF804FD;
	Thu, 24 Feb 2022 16:45:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB88CF800F3; Thu, 24 Feb 2022 16:45:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F367F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 16:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F367F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n1qJ+J5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645717512; x=1677253512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PzX96kduRIYE/gKPsTNuQPtzkDDYW6yJR2z6E96mZSY=;
 b=n1qJ+J5BKysnwMJN63cDu/slPxu0Xm6/9DlJ6741muKxAWAJ1ceJioQw
 yYhln/i2tNb1dOTUnbdTaXs1hScjHc0E9R41duvnwNAa5kAoIebXud/bx
 Gf2kEcr1J7I0TG0iHszrWKbagt/Z4VC+7fUGCilfYWKsWDCK/zKvYLsxp
 COwj8GnIdEuYS3/G9rVno3QJGTu1xI4Gtgb5DW7fUMfGG/l4gomRAow0L
 X3J9kp5SReoQy4rWbAid07Cjrz4gmSNP2dwfEaOec1ibyS1piQC9gab4a
 nrv2hWYBzFKt/OtVeMXOP30+W9Egj/kwlQs9J+gB1XXV8+Zh9dQTb01D/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="276890964"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="276890964"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:45:08 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="533178518"
Received: from ronakmeh-mobl1.amr.corp.intel.com (HELO [10.212.97.131])
 ([10.212.97.131])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:45:07 -0800
Message-ID: <87f434b5-0e99-d1d1-e4d1-248cf35cd05c@linux.intel.com>
Date: Thu, 24 Feb 2022 09:44:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] soundwire: qcom: add in-band wake up interrupt
 support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
 <20220224133125.6674-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220224133125.6674-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



On 2/24/22 07:31, Srinivas Kandagatla wrote:
> Some of the Qualcomm SoundWire Controller instances like the ones that are
> connected to RX path along with Headset connections support Waking up
> Controller from Low power clock stop state using SoundWire In-band interrupt.
> SoundWire Slave on the bus would intiate this by pulling the data line high,

typo: initiate

> during clock stop condition.

while the clock is stopped.

A peripheral cannot generate an interrupt after a successful completion
of a write to the ClockStopNow bitfield.


