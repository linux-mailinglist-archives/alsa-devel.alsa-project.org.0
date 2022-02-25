Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0A4C4629
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:24:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3401DE4;
	Fri, 25 Feb 2022 14:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3401DE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795459;
	bh=J9B/a0jLbaT/B029EhJJONAz4BjyNh45Kx20o4dVs74=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRmEPG3mueRWRc90+o7SWgJujxB6tBO6yRhkucUyKidWaieLWiHUORMuUXsY0svZk
	 sHk986115L3DnD/ptjDHeyjKqK1XZuSd9vb+EL9xxdwNRYqnIgSowPliWYaqNdbmAF
	 anStJ4qPYQoV0/UcBZqFmZFKV5s58iTHgWeMpG3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E6B0F80619;
	Fri, 25 Feb 2022 14:11:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254B9F80132; Fri, 25 Feb 2022 13:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C214F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 13:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C214F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="zL5cMZES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645792012; x=1677328012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=p9Ak9NOX9ibO4qAU6vbMRodTIY87h/JOpPOKCV9uebM=;
 b=zL5cMZES6OrMrGJfjNKIv+UeNll2ktOFjfXSb8XzWJnOOuEIYjtWhJyh
 /WzV4o5dWq+Hu35+uITeg5uHlmVo6aE9C1aINeh+9k+msvc8BW+hPpKl/
 1Bq9ZZPFlWFyABxMT7Vtbbh43JKvAbAdEYcwz5LfT2+BGhNQMS3n3ZDcO k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Feb 2022 04:26:44 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 04:26:43 -0800
Received: from [10.50.33.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 25 Feb
 2022 04:26:39 -0800
Message-ID: <35bfd332-891f-1323-8b61-9e4e2fc5cd1c@quicinc.com>
Date: Fri, 25 Feb 2022 17:56:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V0 1/1] ALSA: pcm: fix blocking while loop in
 snd_pcm_update_hw_ptr0()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
References: <cover.1645784757.git.quic_rbankapu@quicinc.com>
 <4d8b1cb4b0db88c3e28207a81403fbf1e4a87bff.1645784757.git.quic_rbankapu@quicinc.com>
 <83e4b67d-91d3-dca9-4b1f-d209f927d517@perex.cz>
 <s5hee3rur42.wl-tiwai@suse.de>
From: Raghu Ballappa Bankapur <quic_rbankapu@quicinc.com>
In-Reply-To: <s5hee3rur42.wl-tiwai@suse.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org,
 Zubin Mithra <zsm@chromium.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krishna Jha <quic_kkishorj@quicinc.com>
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

Hi Takashi,

Thanks for your feedback.

I see your below statement

But,*having either this zero check*  or minimal hw_ptr_buffer_jiffies=1
*would be good in anyway*, even if we add more check for the hw_params
for no-period-wakeup case.

Please review if those changes are Ok

Regards
Raghu

On 2/25/2022 4:53 PM, Takashi Iwai wrote:
> On Fri, 25 Feb 2022 11:52:05 +0100,
> Jaroslav Kysela wrote:
>> On 25. 02. 22 11:39, Raghu Bankapur wrote:
>>> When period interrupts are disabled, while loop in snd_pcm_update_hw_ptr0()
>>> results in the machine locking up if runtime->hw_ptr_buffer_jiffies is 0.
>>> Validate runtime->hw_ptr_buffer_jiffies value before while loop to avoid
>>> delta check.
>> I would set hw_ptr_buffer_jiffies to 1 in this case in snd_pcm_post_start().
> I thought of it at the first glance, but after reading the code again,
> I doubt whether it makes sense at all to allow this condition.
> Since the buffer size is too small and the rate is too high, we can't
> calculate the buffer crossing condition accurately under such
> condition.
>
> But, having either this zero check or minimal hw_ptr_buffer_jiffies=1
> would be good in anyway, even if we add more check for the hw_params
> for no-period-wakeup case.
>
>
> thanks,
>
> Takashi
