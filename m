Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F21803B7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 17:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D371661;
	Tue, 10 Mar 2020 17:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D371661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583858406;
	bh=mS5VFUhzOgLLu/mzCb+vYTxZcKCWq0/aqhfwO1oDly4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruNRxVnAKJEMrln0BCBMtMAIlfGQUS0Eol8GuVJW4KdW/XTzLNnH1Kmd1N0qoOIIZ
	 1GJob/riE/0XXX/T46XuPYdAaHpBByyn2DPPhZkf+M8+H1gPM5JzBb+mzZhMItEzHu
	 6/1TUfPspWq7bHiWQymKPAcfRkirkk08AmWcdKZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0971F80246;
	Tue, 10 Mar 2020 17:38:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85681F8021C; Tue, 10 Mar 2020 17:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 145C0F800DA
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 17:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 145C0F800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 09:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="321858019"
Received: from djdickof-mobl.amr.corp.intel.com (HELO [10.252.192.103])
 ([10.252.192.103])
 by orsmga001.jf.intel.com with ESMTP; 10 Mar 2020 09:38:37 -0700
Subject: Re: [RFC PATCH] soundwire: bus: Add flag to mark DPN_BlockCtrl1 as
 readonly
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20200309173755.955-1-srinivas.kandagatla@linaro.org>
 <d94fca16-ed61-632a-6f8c-84e3a97869c7@linux.intel.com>
 <92d3ae1b-bace-1d20-ef99-82f7e1a0a644@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2b24f84-0f9a-29ab-8748-dc5a26c05ffa@linux.intel.com>
Date: Tue, 10 Mar 2020 10:53:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <92d3ae1b-bace-1d20-ef99-82f7e1a0a644@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hi Srinivas,

>>  > My recommendation would be to add a DisCo property stating the
>> WordLength value can be used by the bus code but not written to the 
>> Slave device registers.
> 
> Does something like "mipi-sdw-read-only-wordlength" as slave property, 
> make sense?

The properties can be handled at two levels.

First, you'd want to change include/linux/soundwire/sdw.h, and add a new 
field in

struct sdw_dpn_prop {
	u32 num;
	u32 max_word;
	u32 min_word;
	u32 num_words;
	u32 *words;
+       bool read_only_wordlength;

Once this is added, along with the code that bypasses the programming of 
DPn_BlockCtrl1, the implementation has two choices:

a) hard-code the field value in the codec driver.

b) read the property from firmware with the DisCo helpers.

There is no requirement that all properties be read from firmware, and 
if you look at existing code base sdw_slave_read_prop() is currently 
unused, each codec implements its own .read_prop() callback.

We really wanted to be pragmatic, and give the possibility to either 
override bad firmware or extend incomplete firmware to avoid coupling OS 
and firmware too much. If you foresee cases where this implementation 
might vary and firmware distribution is not a problem, then a property 
read would make sense.

Just once procedural reminder that all 'mipi-sdw' properties are handled 
by the MIPI software WG, so we'd need to have this property added in a 
formal MIPI document update.

I suggest you talk with Lior first on this.

Hope this helps
-Pierre
