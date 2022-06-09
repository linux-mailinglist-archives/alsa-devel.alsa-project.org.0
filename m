Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABA5454A2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 21:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6DE1F2C;
	Thu,  9 Jun 2022 21:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6DE1F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654801794;
	bh=c38Un+y998cp1mk//MudRgxdikF4s6RsjatPEg81vl0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGtEtte8DMJbnsVpBFSoVIgBFDfjrKy3/L5qHkUxD4Qaib1j5r88F3xqCgP9AyU2n
	 8RpevwxYVt+sELZjFAjYiXGO3VHpgn8FjGmpuDNafGZaQe3PemVDiAOGkFC33s5ViU
	 +vwQ3ON4iwyJiVUCHplCTppBGi1bpctrpLMra4DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1362F80240;
	Thu,  9 Jun 2022 21:08:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254F3F801F5; Thu,  9 Jun 2022 21:08:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E3C1F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 21:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E3C1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H3Qoglo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654801729; x=1686337729;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c38Un+y998cp1mk//MudRgxdikF4s6RsjatPEg81vl0=;
 b=H3Qoglo+T7FQNLYnsLIqAKdCpEwjKlKJyt4krwRjwGYhL82a7PUpMrhn
 VhVMRz8+vIS5Mjd6hZp4iC5t3EKPtCn3bpQbmjqlOWYsH27DohGCwO07s
 XmGy8r5A50adKKy7a3BaGKnCEIiabz4ASe9UJe49gwKhhHD8oPvpGg4pY
 aVKb1EFIa3es7+yoCdRh5tIHHB+jv7iHpsfhwdR6wMj3ewslOfPlmNAKI
 5I2TNp0K3lzTlDoDNED4Za1bySymAz5BNa+pl1ys43wtXIE08dNilXP5V
 FoyDXP1kv9OqZk1cU7B3jwDif47/3W2laphonL3y52BLH2vgPCq0mhzH5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278533565"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="278533565"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 12:08:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585751984"
Received: from jeremywe-mobl3.amr.corp.intel.com (HELO [10.209.173.145])
 ([10.209.173.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 12:08:12 -0700
Message-ID: <a7ec7867-453c-f22d-ed1c-b793a5351837@linux.intel.com>
Date: Thu, 9 Jun 2022 14:08:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v1 14/16] soundwire: Use acpi_dev_for_each_child()
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <1843211.tdWV9SEqCh@kreacher> <5296779.Sb9uPGUboI@kreacher>
 <63d7f3ed-b5a9-c869-5d25-a33a1d4e63c8@linux.intel.com>
 <CAJZ5v0i7xtjrEOXgKiWP5St8OZoiZ4qq+gL62BFrmv-qpeaG_w@mail.gmail.com>
 <7652ddab-53a5-ac8e-33f5-d25527acb1a6@linux.intel.com>
 <CAJZ5v0jR1_tO_t90UKQFjYfyE+vOoToJSMCfZ8y37voaYO=wJQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAJZ5v0jR1_tO_t90UKQFjYfyE+vOoToJSMCfZ8y37voaYO=wJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/9/22 12:35, Rafael J. Wysocki wrote:
> On Thu, Jun 9, 2022 at 6:21 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>>> Shouldn't the return of sdw_acpi_find_one() be trapped, e.g. with
>>>>
>>>> return acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);
>>>
>>> Sure, I'll do that.  Thanks!
>>
>> I also added this EXPORT_SYMBOL to work-around link errors, not sure if
>> this is in your tree already?
> 
> One of the previous patches in the series is adding the export.

ok. I ran a bunch of tests with those two changes, so feel free to take
my tags:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
