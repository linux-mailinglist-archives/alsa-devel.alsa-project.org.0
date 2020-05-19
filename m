Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0DE1D90E8
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 09:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54E417BE;
	Tue, 19 May 2020 09:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54E417BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589872919;
	bh=1jT1W/ydU3BqDCVDDCoHvLnrD4Q3FZCE3wKld24qVyc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9oEU9rxul8pUapbK0NfnmY/MR1E43twUQlJEbSo+NdUQx6zUp6Z2t3RzlmNj2V/9
	 HynEm/yobeQTPP30RS7uMevNwOqjGaOk55vaBwsPdvY/u3uE2wJF8yqQdFdOKgz/Eg
	 Ln1eK/XQf27yB+usBUv9gzusBrr5agJJuEUPQxrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3ACFF801F8;
	Tue, 19 May 2020 09:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2559F801A3; Tue, 19 May 2020 09:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C15DF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 09:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C15DF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ezelM7YR"
Received: from localhost (unknown [122.182.207.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 078DF2070A;
 Tue, 19 May 2020 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589872802;
 bh=1jT1W/ydU3BqDCVDDCoHvLnrD4Q3FZCE3wKld24qVyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezelM7YRbWjKGsyjoXVM4BMEeOFteFw61AqTzP6YRmQ8uAVepkgKUD9zMj+sPd8eC
 quTaErEsn9RcpPmrFRXzz4SK8W98ocgbGVj1x0QoraK7CNWX485vAA6ZBaPwnCrjLb
 PcI6ovYqwax9tAWHyUVga4J3dnNGF3DWMx4mNfbg=
Date: Tue, 19 May 2020 12:49:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/5] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200519071958.GL374218@vkoul-mobl.Dlink>
References: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 19-05-20, 01:43, Bard Liao wrote:
> This series adds sdw master devices support.
> 
> changes in v2:
>  - Allocate sdw_master_device dynamically
>  - Use unique bus id as master id
>  - Keep checking parent devices
>  - Enable runtime_pm on Master device

I tested on RB3 board and it looks good to me, Applied all now.

Thanks for the good cleanup :)

-- 
~Vinod
