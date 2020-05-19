Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64A31D9913
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 16:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D0D1760;
	Tue, 19 May 2020 16:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D0D1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589897529;
	bh=JYwdbAEvDvQlKjkqjM1FAAVeUY4eLELMMyAO2apEp98=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGceVZDbBsacFc+zPkyQpSDzKNjj8yvm0pUYPCmfOgtOVbca0jZS9DrvPlMtPGmbv
	 ZBDAtVT1YgJIAGBiuAWgL1ypsdjtGnqZRymZvzzJrrVZhi7qGVrBkiLvFyNQLab+ag
	 6m09D16MjZikKmoMOOQc60hwjgmDlc6N65Ue9Hzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B71CF801F8;
	Tue, 19 May 2020 16:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B628F801A3; Tue, 19 May 2020 16:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BA7BF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 16:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA7BF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lk2TW4a8"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3E472065F;
 Tue, 19 May 2020 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589897416;
 bh=JYwdbAEvDvQlKjkqjM1FAAVeUY4eLELMMyAO2apEp98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lk2TW4a8TfpQpfvd56OBDl2FmL++QIDwKZgTl0RO+IIy2muyP8IxycpZnB0WgmGYq
 LPh1b1/OUOQjy6FSkEENQFftoZ2S4IplY0RAWDRdx74zBaywjFOw4ebcP+rSUi3Kjh
 vx+omNI9L6WaTFkTnTf2K2/hvH7c4KN55wAijfuQ=
Date: Tue, 19 May 2020 16:10:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: add Slave sysfs support
Message-ID: <20200519141014.GA535881@kroah.com>
References: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
 <20200518203551.2053-4-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518203551.2053-4-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, mengdong.lin@intel.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On Tue, May 19, 2020 at 04:35:51AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Expose MIPI DisCo Slave properties in sysfs.
> 
> For Slave properties and Data Port 0, the attributes are managed with
> simple devm_ support.
> 
> A Slave Device may have more than one Data Port (DPN), and each Data
> Port can be sink or source. The attributes are created dynamically
> using pre-canned macros, but still use devm_ with a name attribute
> group to avoid creating kobjects - as requested by GregKH. In the
> _show function, we use container_of() to retrieve port number and
> direction required to extract the information.
> 
> Audio modes are not supported for now. Depending on the discussions
> the SoundWire Device Class, we may add it later as is or follow the
> new specification.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
