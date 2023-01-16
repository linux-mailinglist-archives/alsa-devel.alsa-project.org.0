Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAB66CE5E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 19:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D631597B;
	Mon, 16 Jan 2023 19:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D631597B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673892434;
	bh=zSrlJOl6mUi04pTIjgeQpEmQFl7alGult2nqhe5MceM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YKKtDju+/CQdj1W3hxYS+tVAdKoHGnDKw+FAgZgB1NdfGGEOU84Rcj/H9mQaCN7SF
	 x7qI2qm3InpoXW953TooQcwjzNlMkTdoIX6vD+HiChRcRZl4ZGTPE+i7EElvrKQJNg
	 RzhBp8FJhR45qFegEzvYF2qZPYWsFYYD1gV3wdWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14239F8023B;
	Mon, 16 Jan 2023 19:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00548F80482; Mon, 16 Jan 2023 19:06:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DATE_IN_PAST_03_06,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1D14F8023B
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 19:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1D14F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OhvVoIcn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673892368; x=1705428368;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zSrlJOl6mUi04pTIjgeQpEmQFl7alGult2nqhe5MceM=;
 b=OhvVoIcnGwse8FrzLTJ8DxOdhkpJ9gXT+S7t5Tj6CXecvfZYkahcyu8R
 9LqSFSwwqCsVeOnfkAfO5IS+UDXV4FP2YPz0QqmFBF6+U3HJR6spVab4Y
 blzVzETxHDLEbHL7RNCFuhF7eaBQG51q6G6+4G+BTgWiH0Uwt7Lbm4h0r
 chFuGZ3aH0WVIckkd49lThQqaRPE7m+rPWq+9lP/po63i/zg/q0FjDdOt
 o/q4k8txs5AuM/Eu416UpEpbmgwMK+4j7BT6LgbJLu/IkHVb8GrklrQTZ
 K8h9b3d2lQNBAgdvgyLWUsNRQMn8jpFkqDqEdcnd9PYRSYqpmaJVuOsez g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351767486"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="351767486"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:06:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="766987448"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="766987448"
Received: from mahdiahm-mobl1.amr.corp.intel.com (HELO [10.213.173.94])
 ([10.213.173.94])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:05:59 -0800
Message-ID: <d5638ec8-3fa4-4643-9740-ef87a4ba5833@linux.intel.com>
Date: Mon, 16 Jan 2023 08:57:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 02/19] soundwire: amd: Add support for AMD Master driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-3-Vijendar.Mukunda@amd.com>
 <991ff630-17a7-eef3-1436-e4a905fe0541@linux.intel.com>
 <78741dee-9257-77c2-8950-0519ccb462e6@amd.com>
 <420258d4-1f66-5288-f421-b26b2a2a35ea@linux.intel.com>
 <dbf20726-3900-9bff-7a72-14608702f636@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <dbf20726-3900-9bff-7a72-14608702f636@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/16/23 01:53, Mukunda,Vijendar wrote:
> On 14/01/23 00:11, Pierre-Louis Bossart wrote:
>>>>> +	for (index = 0; index < 2; index++) {
>>>>> +		if (response_buf[index] == -ETIMEDOUT) {
>>>>> +			dev_err(ctrl->dev, "Program SCP cmd timeout\n");
>>>>> +			timeout = 1;
>>>>> +		} else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
>>>>> +			no_ack = 1;
>>>>> +			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
>>>>> +				nack = 1;
>>>>> +				dev_err(ctrl->dev, "Program SCP NACK received\n");
>>>>> +			}
>>>> this is a copy of the cadence_master.c code... With the error added that
>>>> this is not for a controller but for a master...
>>> Its manager instance only. Our immediate command and response
>>> mechanism allows sending commands over the link and get the
>>> response for every command immediately, unlike as mentioned in
>>> candence_master.c.
>> I don't get the reply. The Cadence IP also has the ability to get the
>> response immediately. There's limited scope for creativity, the commands
>> are defined in the spec and the responses as well.
> As per our understanding in Intel code, responses are processed
> after sending all commands.
> In our case, we send the command and process the response
> immediately before invoking the next command.

The Cadence IP can queue a number of commands, I think 8 off the top of
my head. But the response is provided immediately after each command.

Maybe the disconnect is that there's an ability to define a watermark on
the response buffer, so that the software can decide to process the
command responses in one shot.

>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	if (timeout) {
>>>>> +		dev_err_ratelimited(ctrl->dev,
>>>>> +				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
>>>>> +		return SDW_CMD_TIMEOUT;
>>>>> +	}
>>>>> +
>>>>> +	if (nack) {
>>>>> +		dev_err_ratelimited(ctrl->dev,
>>>>> +				    "SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
>>>>> +		return SDW_CMD_FAIL;
>>>>> +	}
>>>>> +
>>>>> +	if (no_ack) {
>>>>> +		dev_dbg_ratelimited(ctrl->dev,
>>>>> +				    "SCP_addrpage ignored for Slave %d\n", msg->dev_num);
>>>>> +		return SDW_CMD_IGNORED;
>>>>> +	}
>>>>> +	return SDW_CMD_OK;
>>>> this should probably become a helper since the response is really the
>>>> same as in cadence_master.c
>>>>
>>>> There's really room for optimization and reuse here.
>>> not really needed. Please refer above comment as command/response
>>> mechanism differs from Intel's implementation.
>> how? there's a buffer of responses in both cases. please clarify.
> Ours implementation is not interrupt driven like Intel.
> When we send command over the link, we will wait for command's
> response in polling method and process the response immediately
> before issuing the new command.

On the Intel side we use an interrupt to avoid polling, and in case of N
commands the watermark will be set to N to reduce the overhead. That
said, most users only use 1 command at a time, it's only recently that
Cirrus Logic experimented with multiple commands to speed-up transfers.

Even if there are differences in the way the responses are processed,
whether one-at-a-time or in a batch, the point remains that each command
response can be individually analyzed and that could be using a helper -
moving code from cadence_master.c into the bus layer.


