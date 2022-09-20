Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F85BDC03
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 07:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B1BC1EF;
	Tue, 20 Sep 2022 07:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B1BC1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663650365;
	bh=wnzt8PW3zP9wtrewvt5xUq0/W2ToEB86MUL4a6EzQ74=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDbZYKTfcaoqZUoF1BBus3HvgcIEUHr+5eNZZbYkw/kie09nw6UqWwKr2NiNzRRBj
	 5ch/Q9fARldUzyxeAT/L6dyx/Q9Ua93fbIj4HfUAvF6/YRWC/hHK6JfIEQ3zAyp1Pf
	 VvM9cXXdtwFsJN6cIOcwO1n1czc2bsBpPv+DmhPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A294EF800C9;
	Tue, 20 Sep 2022 07:05:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B28BF80155; Tue, 20 Sep 2022 07:05:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E700EF800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 07:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E700EF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="alEivXXa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C565B82471;
 Tue, 20 Sep 2022 05:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465BCC433C1;
 Tue, 20 Sep 2022 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663650299;
 bh=wnzt8PW3zP9wtrewvt5xUq0/W2ToEB86MUL4a6EzQ74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=alEivXXaV7UE1FPN9+i6lHMvQP2Y35TWzGnpVSO3WlAf+WoMPOlV08+t10uNZAmA6
 UQUSQfjdv0x1Mg3ErWUUZP2GXVQZFLoPJpwP30grxbu3FM8mojq6oWoqXWAWPE4JSW
 Q9DslhB7EwVpjekwVUEeAIMCWwRxxMvVaNxCHLVvVZzVgMaGXvNHyKyv7+Yt4XGO7k
 4zHGFY1RThlLcALwNrOhntokSCtcqciIE75WEvvUKnnp5kNMWhjCoVhwC9eEJlG4ur
 30a3agResor32XjxuoTFXacUYEzZRZSDEr9whTllllOID0U1sQWJ+wQthn2KTfl3wj
 6Md58N9TCp+nQ==
Date: Tue, 20 Sep 2022 10:34:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] soundwire: qcom: update status from device id 1
Message-ID: <YylJ90Vu7SUhSNIo@matsya>
References: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 quic_srivasam@quicinc.com
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

On 16-09-22, 14:53, Srinivas Kandagatla wrote:
> By default autoenumeration is enabled on QCom SoundWire controller
> which means the core should not be dealing with device 0 w.r.t enumeration.
> 
> During Enumeration if SoundWire core sees status[0] as SDW_SLAVE_ATTACHED and
> start programming the device id, however reading DEVID registers return zeros
> which does not match to any of the slaves in the list and the core attempts
> to park this device to Group 13.  This results in adding SoundWire device
> with enumeration address 0:0:0:0
> 
> Fix this by not passing device 0 status to SoundWire core.

Applied after fixing typi pointed by Pierre, thanks

Also, pls check, I got conflict which was resolved

-- 
~Vinod
