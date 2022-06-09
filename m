Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E729E5451C6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 18:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8458A1AD3;
	Thu,  9 Jun 2022 18:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8458A1AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654791767;
	bh=0CsSwkvejVm3bVTO7Azc2brKlKE9Yji53qGgFJwL8DY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SL7LadYRvEEDHXvWdCnokTR0+DPSvJe98vABPx9Pja5tW3uW1fjlb/hy12k6aoUJ+
	 uc8gLj1RjpYVgjbqZGLctLYaOMVJ/LRsa1CWGp184Im79U7HcEj+wILvVv7NIuGOWB
	 C4QzGtc3vkkQEcDDcQ93twSNF/54x7tY4n3Swc74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C945F80240;
	Thu,  9 Jun 2022 18:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 694D7F800E9; Thu,  9 Jun 2022 18:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0490CF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 18:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0490CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bp+rtrcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654791700; x=1686327700;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0CsSwkvejVm3bVTO7Azc2brKlKE9Yji53qGgFJwL8DY=;
 b=bp+rtrcLWDG7LW4u4K18RCYpn0Bqomj1UxSCwQj9zw7BNnSUJRVludIP
 vsXp3QNOE24Li8JafPc+2ah52RB97X8D83ujfBs8Umx9232WnUqqV05js
 f1vNHB27yTijYVRsIfxrHzFylfCP1JdIl5JJfYAODXYsPW30LAGNLxhDv
 BgNjfW8dlqlBnvcRBwYpO44tt5/vIIzKgVenPHMQaH5TW2MC49dzqDYhy
 dRDUyXJAiFeSDqnlGwYbNYcxeKgB4Qhf5VeMixkqZf2yZeJWAg6k+lyS7
 7qY+JeuFrhzlYGfyApP1lxVv1F9AViagyGXmqaWX39iXGHR4NDha3yTBM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302708257"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="302708257"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 09:21:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585661484"
Received: from jeremywe-mobl3.amr.corp.intel.com (HELO [10.209.173.145])
 ([10.209.173.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 09:21:33 -0700
Message-ID: <7652ddab-53a5-ac8e-33f5-d25527acb1a6@linux.intel.com>
Date: Thu, 9 Jun 2022 11:21:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v1 14/16] soundwire: Use acpi_dev_for_each_child()
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <1843211.tdWV9SEqCh@kreacher> <5296779.Sb9uPGUboI@kreacher>
 <63d7f3ed-b5a9-c869-5d25-a33a1d4e63c8@linux.intel.com>
 <CAJZ5v0i7xtjrEOXgKiWP5St8OZoiZ4qq+gL62BFrmv-qpeaG_w@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAJZ5v0i7xtjrEOXgKiWP5St8OZoiZ4qq+gL62BFrmv-qpeaG_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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


>> Shouldn't the return of sdw_acpi_find_one() be trapped, e.g. with
>>
>> return acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);
> 
> Sure, I'll do that.  Thanks!

I also added this EXPORT_SYMBOL to work-around link errors, not sure if
this is in your tree already?

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c

index 86fa61a21826c..ade6259c19af6 100644

--- a/drivers/acpi/bus.c

+++ b/drivers/acpi/bus.c

@@ -1113,6 +1113,7 @@ int acpi_dev_for_each_child(struct acpi_device *adev,



        return device_for_each_child(&adev->dev, &adwc,
acpi_dev_for_one_check);

 }

+EXPORT_SYMBOL_GPL(acpi_dev_for_each_child);


