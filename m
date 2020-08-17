Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E822468A6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 16:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74A416DC;
	Mon, 17 Aug 2020 16:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74A416DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597675702;
	bh=+lF/g1sq+zugh8mmaCClWBhYb2+hfst7beX7w5wRC/I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2jP/bdmyVS5V2xMTKlGW7XXlxGWtQIwhOv2EzcoPbMg+KY5rxv59qxIkI96BHTQ7
	 RD+YOmzjSuHb65SKKqUm+5gJ+EoydZQrdExMUveL56j13bSP1NtlD//yStxRz7jqHD
	 KH45xodHQlw21Rcav4WCKoQRYDi/PhTAgCSx1fJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B99D8F800D3;
	Mon, 17 Aug 2020 16:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E58CF80218; Mon, 17 Aug 2020 16:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E8F3F800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 16:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E8F3F800D3
IronPort-SDR: oJ+9uPjgx6nTWlH80RqTCfMmiHFX3xnV1NRdWCaRvqlWZaA5Cxi1d0GkovaTT4Q7KdA/QNCU0c
 4LuBbKr3RfAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="239541501"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="239541501"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 07:46:25 -0700
IronPort-SDR: xNqpQ4+oAK0T5d3KMDpO/z75SQuJ4v+gLwH/xKFyVVU5I0nK7o72OOvLguw/zRys8gqjneq48h
 UWENS81sxitw==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="310117114"
Received: from jhor-mobl.gar.corp.intel.com (HELO [10.209.166.196])
 ([10.209.166.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 07:46:23 -0700
Subject: Re: [PATCH 00/13] soundwire: intel: add power management support
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200817120841.GQ2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d8f8f64f-34db-9c9a-c821-83dda3b2db9a@linux.intel.com>
Date: Mon, 17 Aug 2020 09:46:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817120841.GQ2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
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



On 8/17/20 7:08 AM, Vinod Koul wrote:
> On 22-07-20, 04:37, Bard Liao wrote:
>> This series adds power management support for Intel soundwire links.
> 
> I had applied except 3 & 9 (few skipped in middle due to conflict while
> applying), BUT I get a build failure on patch 2 onwards :(
> 
> drivers/soundwire/intel_init.c: In function ‘sdw_intel_cleanup’:
> drivers/soundwire/intel_init.c:72:4: error: implicit declaration of function ‘pm_runtime_disable’ [-Werror=implicit-function-declaration]
>     72 |    pm_runtime_disable(&link->pdev->dev);
> 
> I suspect due to missing header? I was on x64 build with allmodconfig
> 
> So only patch 1 is applied and pushed now

I just tried on these series applied on top of soundwire/next

commit 9b3b4b3f2f2af863d2f6dd65afd295a5a673afa2 (soundwire/next)

     soundwire: intel: Add basic power management support

And I don't see any issue?

If you want to double-check merge issues, I pushed the code here: 
https://github.com/plbossart/sound/tree/sdw/pm_runtime_soundwire_next

I am really not sure what conflicts you are referring to, git am worked 
fine for me, only skipped the first patch that's already applied.

$git am ~/Downloads/alsa/122/\[PATCH\ *
Applying: soundwire: intel: Add basic power management support
error: patch failed: drivers/soundwire/intel.c:463
error: drivers/soundwire/intel.c: patch does not apply
Patch failed at 0001 soundwire: intel: Add basic power management support
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
$ git am --skip
Applying: soundwire: intel: add pm_runtime support
Applying: soundwire: intel: reset pm_runtime status during system resume
Applying: soundwire: intel: fix race condition on system resume
Applying: soundwire: intel: call helper to reset Slave states on resume
Applying: soundwire: intel: reinitialize IP+DSP in .prepare(), but only 
when resuming
Applying: soundwire: intel: pm_runtime idle scheduling
Applying: soundwire: intel: add CLK_STOP_TEARDOWN for pm_runtime suspend
Applying: soundwire: intel: add CLK_STOP_BUS_RESET support
Applying: soundwire: intel: add CLK_STOP_NOT_ALLOWED support
Applying: soundwire: intel_init: handle power rail dependencies for 
clock stop mode
Applying: soundwire: intel: support clock_stop mode without quirks
Applying: soundwire: intel: refine runtime pm for 
SDW_INTEL_CLK_STOP_BUS_RESET

I tried the compilation twice, once with our default SOF config and once 
with allmodconfig.

make drivers/soundwire/ W=1
   GEN     Makefile
   YACC    scripts/genksyms/parse.tab.[ch]
/data/pbossart/ktest/broonie-next/scripts/genksyms/parse.y: warning: 9 
shift/reduce conflicts [-Wconflicts-sr]
/data/pbossart/ktest/broonie-next/scripts/genksyms/parse.y: warning: 5 
reduce/reduce conflicts [-Wconflicts-rr]
   HOSTCC  scripts/genksyms/parse.tab.o
   HOSTCC  scripts/genksyms/lex.lex.o
   HOSTLD  scripts/genksyms/genksyms
   CC      scripts/mod/empty.o
   MKELF   scripts/mod/elfconfig.h
   HOSTCC  scripts/mod/modpost.o
   CC      scripts/mod/devicetable-offsets.s
   HOSTCC  scripts/mod/file2alias.o
   HOSTCC  scripts/mod/sumversion.o
   HOSTLD  scripts/mod/modpost
   CC      kernel/bounds.s
   CC      arch/x86/kernel/asm-offsets.s
   CALL    /data/pbossart/ktest/broonie-next/scripts/checksyscalls.sh
   CALL    /data/pbossart/ktest/broonie-next/scripts/atomic/check-atomics.sh
   DESCEND  objtool
   CC [M]  drivers/soundwire/bus_type.o
   CC [M]  drivers/soundwire/bus.o
   CC [M]  drivers/soundwire/master.o
   CC [M]  drivers/soundwire/slave.o
   CC [M]  drivers/soundwire/mipi_disco.o
   CC [M]  drivers/soundwire/stream.o
   CC [M]  drivers/soundwire/sysfs_slave.o
   CC [M]  drivers/soundwire/sysfs_slave_dpn.o
   CC [M]  drivers/soundwire/debugfs.o
   LD [M]  drivers/soundwire/soundwire-bus.o
   CC [M]  drivers/soundwire/cadence_master.o
   LD [M]  drivers/soundwire/soundwire-cadence.o
   CC [M]  drivers/soundwire/intel.o
   CC [M]  drivers/soundwire/intel_init.o
   LD [M]  drivers/soundwire/soundwire-intel.o
   CC [M]  drivers/soundwire/qcom.o
   LD [M]  drivers/soundwire/soundwire-qcom.o



