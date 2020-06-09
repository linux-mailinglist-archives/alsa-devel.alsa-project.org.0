Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467B1F335B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 07:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 229041676;
	Tue,  9 Jun 2020 07:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 229041676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591680495;
	bh=oraUJGU/LS+UpJaybh4JymhynyUitP+Vtl8eSzPahaQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thIgGIRal66uujfLCTW6rHisy/dudoU1anOBqBzcLuzOSIrW2sa/UfCiuv/dmmdc2
	 yC/gn5l6mjscwnhfOCxBZTee1RJmixnqcMm3x+AIgH2u/9jmoSTemVMLSv9tlnJpWG
	 m5baFW2frxVL26VF/WjrxhXXRPbz0gKRX99sZJUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41F86F8028D;
	Tue,  9 Jun 2020 07:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6380CF8028C; Tue,  9 Jun 2020 07:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EBA3F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 07:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EBA3F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cY+q7KGj"
Received: from localhost (unknown [122.171.156.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6476F207ED;
 Tue,  9 Jun 2020 05:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591680383;
 bh=oraUJGU/LS+UpJaybh4JymhynyUitP+Vtl8eSzPahaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cY+q7KGjWEDdP+aVkF7LUcJ6AC7zUPdcIbTzMjSf2gQAOV6ip2Ne8qEoVrCAqxb/s
 avyfkHivaafBH4ZV+Jsyb9pUSdu1Bwzvlt3JWLfZV7maM9znpa5Zvh+DHOvldr3zYG
 bdAOEry1ENaIW+odwNrJ6XbCf0EKtuVN2AJMvANs=
Date: Tue, 9 Jun 2020 10:56:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 3/5] soundwire: qcom: add v1.5.1 compatible
Message-ID: <20200609052619.GB1084979@vkoul-mobl>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608204347.19685-4-jonathan@marek.ca>
Cc: alsa-devel@alsa-project.org,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 08-06-20, 16:43, Jonathan Marek wrote:
> Add a compatible string for HW version v1.5.1 on sm8250 SoCs.

Please document this new compatible

-- 
~Vinod
