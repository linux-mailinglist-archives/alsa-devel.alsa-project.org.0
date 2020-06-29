Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92A20CDC3
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 12:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4308E851;
	Mon, 29 Jun 2020 12:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4308E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593425066;
	bh=QQIpsg5pRTbPO4SDaA12RidiMZ10FPepIZFzx29G3fM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eajyBiPJiHzfMERrlS/lqHfB0f0iQAlFn4tKSQEok6ja/hC95dYwvhOGyFoPLhu5w
	 9sjI0whr+fWlcY8sfl0u5KY/Kq4cVMIGcNlDmn0mUK3nmtySoIdkKBhzyziqu4v7YH
	 8Bd+jamy1vydP+eZQ3OZdd5wFhXKkFjqD73k4nQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 349A3F80096;
	Mon, 29 Jun 2020 12:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64CE4F8020C; Mon, 29 Jun 2020 12:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03FA1F800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 12:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FA1F800BA
IronPort-SDR: Yq+bGY/b7eQ7myeE254Kp/I1QKkFEv7dwggmg2j7BRJ+xRtu17TOLxJ1NERGWANkqktoO/8mUs
 6vYPtiMMA+Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="134255303"
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="134255303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 03:02:35 -0700
IronPort-SDR: iMh8vArVq5oKcUs1FZ2st6Xi9hqb9Zp7LxQRW3BbWxsw9h9DLQhK2MvqWpzKdyJo8GaJrgTQm+
 +TD8xya/8LSw==
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="424765568"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.138.39])
 ([10.249.138.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 03:02:32 -0700
Subject: Re: [PATCH v4 1/3] ALSA: compress: document the compress audio state
 machine
To: Vinod Koul <vkoul@kernel.org>
References: <20200629075002.11436-1-vkoul@kernel.org>
 <20200629075002.11436-2-vkoul@kernel.org>
 <c29b3199-cebd-2153-5530-e75f76aa8b4b@linux.intel.com>
 <20200629093429.GA2599@vkoul-mobl>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <3a43467a-5432-a3ef-2250-2ac1054539d0@linux.intel.com>
Date: Mon, 29 Jun 2020 12:02:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629093429.GA2599@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 6/29/2020 11:34 AM, Vinod Koul wrote:
 >
 > Not sure, this is not in the version I posted, arrow is from setup ->
 > prepare. See 
https://lore.kernel.org/alsa-devel/20200629075002.11436-2-vkoul@kernel.org/
 >
 > I don't know how it got reversed in your version, maybe the MUA messed
 > up??
 >
Ah... I must have edited it myself when preparing edited version, sorry 
for noise ;)


 > a compr_write() moves from SETUP -> PREPARE. Fixing that above looks
 > better version of mine..
Yes, I feel it is easier to understand, A redirect confused me for a 
short bit when I first looked at graph and it can be easily avoided.
