Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7A19311E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 20:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A97F01682;
	Wed, 25 Mar 2020 20:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A97F01682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585164534;
	bh=efaWdAgnOTyV12x6jL5jVBzwEEXsLQHNixxPtxDYOAo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDlIsa3z1GsdMSGCAkQFejkMP8nRGbyW0EeVEmeEVg2xb+M1zkv3lMKs0Bh0L+Egi
	 Lzxr1+tddpfZhbNYrqQCFGLYU+CTmkpL5meDrjetzwI2Wb0I91mjs70Y3piyhW6Bdp
	 EA4PfGkmd/IoE8gcfRNE0M9/rpqH2BXJ4YEm2H4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FB8F80095;
	Wed, 25 Mar 2020 20:27:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D2A5F80095; Wed, 25 Mar 2020 20:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBD6AF80095
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 20:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBD6AF80095
IronPort-SDR: beeNrplaljczjKCosn3PKrYaIRAEClfyWLJ5o7n6KDF+J+Q3eR/21T+KYZTOVv2H5IRDatcjS6
 5ZdkUxOC+E7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 12:26:53 -0700
IronPort-SDR: S3xA04QW1He1IIbmwqbR5h3VE7V240tMOd3N/fjEOnrqQPU7VMDcBVPj2NMlxk4HHJUNsiKBq4
 zadDc5pTBCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="293427579"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.3.125])
 ([10.213.3.125])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2020 12:26:51 -0700
Subject: Re: [PATCH] ASoC: Intel: broadwell: Revert SSP0 link to use dummy
 components
To: Curtis Malainey <cujomalainey@google.com>
References: <20200319211204.21580-1-cezary.rojewski@intel.com>
 <CAOReqxjfqkdy6Z-LGwa3O6ooOpTEdqOWU5nvr8KwG78uebioNw@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f3635d96-e04a-c474-c070-19d0a97c4dfa@intel.com>
Date: Wed, 25 Mar 2020 20:26:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxjfqkdy6Z-LGwa3O6ooOpTEdqOWU5nvr8KwG78uebioNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On 2020-03-25 20:07, Curtis Malainey wrote:
> On Thu, Mar 19, 2020 at 2:13 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>
>> Commit:
>> "ASoC: Intel: broadwell: change cpu_dai and platform components for SOF
> Where does this quote end?

I'm afraid, it doesn't. Does it matter, though? You're not looking at 
the newest version - one that is part of: "[PATCH 0/3] ASoC: Intel: 
boards: Revert SSP0 links to use dummy" series.

Regards,
Czarek
