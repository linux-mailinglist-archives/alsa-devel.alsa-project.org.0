Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A57433CE3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 19:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8161116A3;
	Tue, 19 Oct 2021 18:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8161116A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634662807;
	bh=8aJ/Ph0wA5OCS5/1vE92tsdWGLWSn24SfLKQFeXk5GA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxjurtbsBz5+hTT+xYZlTGBesdSIOWUDmOo69DQw/7zjTJlalh1RDBQVun5b7Nyvg
	 CNExTDYPmm1NCJglsUWf0h2lxf68PNbG8+EDWm83B5t+R5mqbtzmSRDzzOC4xDTNLS
	 02CTBzKssNPrMM76qWu4Zsw8qIPleKrE6MyJh+sE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F122CF8019B;
	Tue, 19 Oct 2021 18:58:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15ACCF80240; Tue, 19 Oct 2021 18:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA37F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA37F80082
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228844530"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="228844530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 09:58:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="483319791"
Received: from kumarr1-mobl1.amr.corp.intel.com (HELO [10.212.58.240])
 ([10.212.58.240])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 09:58:20 -0700
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
 <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
Date: Tue, 19 Oct 2021 11:58:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
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




>> hmm. It's not clear whether we should initialize the regular hdac_bus
>> fields in the ext_bus_init(). For plain HDA, these are also initialized
>> in the caller. E.g. in sound/pci/hda/hda_controller.c.
>>
>> So if we start cleaning up, should we go further put this in
>> snd_hdac_bus_init()?
>>
>> Then another is what is the right place for settings like "sync_write =
>> 1". While this settings applies to all current users of the extended
>> bus, this is really hw specific setting and not really a property of
>> the extended bus, so this feels a bit out-of-place.
> 
> I'm rather in favor of bigger cleanups. We can definitely move further
> in the future : )

I am not opposed to updates in this hdaudio-ext part, but I am in favor
of less ambitious step-by-step changes.

a) This is legacy code where the initial authors have moved on, and it's
very hard to figure out what the intent was. It's quite common to have
discussion on feature v. bug, see e.g. the discussion we had on this in
https://github.com/thesofproject/linux/pull/3175#pullrequestreview-772674119

b) In addition, this code is shared between two teams with separate
testing/CI capabilities and limited number of commercial/shipping
devices. There is a very large risk of introducing bugs even with the
best intentions.

Before we do any changes in functionality, there are already basic steps
that can be done, e.g. using consistent naming between variables, the
existing code is just confusing as can be:

struct hdac_stream *stream;
struct hdac_ext_stream *stream;
struct hdac_stream *hstream;
struct hdac_ext_stream *hstream;

I started basic cleanups here:
https://github.com/thesofproject/linux/pull/3158, I haven't had time to
complete this because of more important locking issues, but I intend to
send those clarifications for the next cycle.

Again before we do large changes let's think of smaller steps and how we
are going to validate those changes.

