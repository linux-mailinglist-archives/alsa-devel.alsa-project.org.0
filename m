Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D136B607
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 17:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D3B1689;
	Mon, 26 Apr 2021 17:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D3B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619451875;
	bh=SLLccNZtla/LVhC+XeuLhgEW8pGmpgkt+4xa0s5SJKg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJAjxfO1uK3kG/auDDThrwzKgAzoys+QmxqkL1wcguAhaLefK8uzdDl3uNmPeDkRA
	 DEIyMymXOo7A7/Xj6BxYaoMt/8zUnw/94uZAi/KRYLhefDxpIW3u2dTx65SQWph6lc
	 tsW5e2gvC3/FTVCh4oA13rYP1++I5oZrqrPBEjWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C64ADF80171;
	Mon, 26 Apr 2021 17:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC7BBF8016C; Mon, 26 Apr 2021 17:43:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=NICE_REPLY_A,
 PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A67F800E3
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 17:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A67F800E3
IronPort-SDR: hC7MSZ0CChFmuOow57Lhhk2lC7F9mwBkWdjbUduUxtX8uyUAZpjP9Zcisp8Ae8IKPq/lkh7qGz
 h4Jmwy0KtKrw==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="183489054"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="183489054"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 08:42:49 -0700
IronPort-SDR: r+JfcCFGTVBpN+8kKpO7LlWFygtRIYmzq5IOqSJigJpf0SRl7tK7qYTxvGPqV7LKsvuNsBd6uJ
 w+0B4ooagt3A==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="618648157"
Received: from fhamberg-mobl2.amr.corp.intel.com (HELO [10.254.34.174])
 ([10.254.34.174])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 08:42:48 -0700
Subject: Re: [PATCH 05/14] ASoC: Intel: boards: byt/cht: set card and driver
 name at run time
To: youling257 <youling257@gmail.com>
References: <20201112223825.39765-6-pierre-louis.bossart@linux.intel.com>
 <20210425181304.29280-1-youling257@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4e9ec8e9-31ba-a93f-3445-dc9648204c3c@linux.intel.com>
Date: Mon, 26 Apr 2021 10:12:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210425181304.29280-1-youling257@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, ranjani.sridharan@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, rander.wang@linux.intel.com
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



On 4/25/21 1:13 PM, youling257 wrote:
> What`s the mean? how to use kernel parameter at run time?

see the options for the snd-intel-dspcfg module

For byt/cht, if you use dsp_driver=3 you will select SOF. if you use 
dsp_driver=2 or don't set the value at all, you will select the legacy 
Atom/sst driver, which is still the default
