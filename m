Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFE5116CF
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 14:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77FBD1798;
	Wed, 27 Apr 2022 14:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77FBD1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651062954;
	bh=DwlaFNkjPNPG6YdPDksnQR0S/JmI5n5fEuE9E3zxPM0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opSsbOMH6GmuLtGrJYN2IwxRfa5ksJ6NJl76VT3CKD22J4kfUhSuuZgSclUzyty/+
	 XGrIhS93Ot1S1qyQGTjOTA12BEone1X5pfWAk0s8z6Ubf7S2S3UmtFlIiQn3TIi5Mf
	 Tnnrm3dQIPD4EyyV7DpYZaQ+2EqyfNub04mSx0Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C8AF80253;
	Wed, 27 Apr 2022 14:34:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F961F8016E; Wed, 27 Apr 2022 14:34:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E722F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 14:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E722F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KmhZFaUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651062891; x=1682598891;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DwlaFNkjPNPG6YdPDksnQR0S/JmI5n5fEuE9E3zxPM0=;
 b=KmhZFaUFe2eZdGxalyfMYXM5mz7wsiAsX3QXw0oir5bFnqUe0/kgcEFw
 Fn4IaevRuT2OQmOVOQlYpw3sFlUXNiS+vFot8pbeeE6TQWQCK+NdASnTw
 bbZJBfuX2U1oQkXrr7IGQvK5xT28oTKLqFnwCD67WzxGT7Djdvvzy/kaN
 Q4DZPoRG1cEZmvE12tZpCfCa9fHyKEwoaWj0L+u7KRgU67neChFOHSz8I
 5PpRkj+ao94/WxMeXLWmouS5NnjppgCr1F5kv9UjxSrOd9qo6vcprbLEG
 7re9f2JHnwzB9ZOszGNhItriZ1fXGsAFgXyCV0EJDwBUvXELR+GzfUW/6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328856703"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="328856703"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:34:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="580570718"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO [10.252.32.27])
 ([10.252.32.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:34:45 -0700
Message-ID: <6b8e7ef5-d5f2-b691-e493-2ba2d8ef783b@linux.intel.com>
Date: Wed, 27 Apr 2022 15:35:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data for
 non bytes payload
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
 <YmknCrJKihRkpyTq@google.com>
 <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
 <YmkvBAgBrxRAMUcO@google.com>
 <03a5d9ee-90ef-e4b9-5117-e59e81407453@linux.intel.com>
 <Ymk3jYPd1lpvfjBE@google.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Ymk3jYPd1lpvfjBE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org
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



On 27/04/2022 15:31, Sergey Senozhatsky wrote:
> On (22/04/27 15:08), Péter Ujfalusi wrote:
>>> clang appears to be unhappy otherwise.
>>>
>>> 	error: comparison of array 'cdata->data' equal to a null pointer is always false
>>>
>>> Changing this into `if (!cdata->data)` is a little bit better as now
>>> 'always false' becomes 'always true'
>>>
>>> 	error: address of array 'cdata->data' will always evaluate to 'true'
>>
>> Hrm, uhm. clang is right. The check is (and was) bogus...
>>
>> cdata->data is a pointer (to cdata->data[0]) which is always:
>> cdata + sizeof(struct sof_ipc_ctrl_data).
>> Checking if it is NULL or not is irrelevant and wrong. If we do not have
>> additional data then cdata->data points to memory which is outside of
>> the struct and it can be random data (might be 0, might not be).
> 
> Yeah to be honest that's what I'm thinking too.
> 
> Does sof_ipc_ctrl_data have to be a var-sized structure? Or can that union
> hold pointers that are allocated separately?
> 
> 	scontrol->data = kzalloc(sizeof sof_ipc_ctrl_data);
> 	scontrol->data->chan = kzalloc(sizeof chan * mc->num_channels)

Unfortunately no, the data/chanv/compv needs to be flexible array as it
is the IPC message itself.

> 
>> I think we can just drop this check as we would not be here if
>> additional data was not allocated for the payload prior?
> 
> I don't have enough knowledge of this code. ->data check doesn't do what
> it is expected to do so removing it shouldn't do harm.

Let me quickly send v3 with dropped cdata->data check.

-- 
Péter
