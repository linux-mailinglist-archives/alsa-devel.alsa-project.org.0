Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEB32D54A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 15:32:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0368E169A;
	Thu,  4 Mar 2021 15:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0368E169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614868341;
	bh=zQ9TJwwg/iVbozRk5Hfg+GjEu/1NCKbdfcnW/d67NsQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJr7rKdZT3rQPjKrNbdrYQ1hLwgzwziSZ7JzfveZlRaK8uXVKckROE1bpfF3vAQpY
	 Yr/Ck06UjCUczNy7ddIDyslWib0yejWQ/5CJINu0SR+ambf54/4qTQGF4BFepYBsg3
	 qmXIpYL9bq6jV+ss4NY8R0/NWC/eI0WLKOHglHY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7041FF80271;
	Thu,  4 Mar 2021 15:30:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA639F80269; Thu,  4 Mar 2021 15:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD1FF8007E
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 15:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD1FF8007E
Received: from [100.112.134.46] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-west-2.aws.symcld.net id C0/22-28581-11FE0406;
 Thu, 04 Mar 2021 14:30:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleJIrShJLcpLzFFi42JJl3vFpiv43iH
 B4MxTRosrFw8xWUx9+ITN4tOH/awW6/rTLX79f8Zk8XLzGyYHNo8Nn5vYPBbvecnksWlVJ5vH
 vJOBHptal7B6bD5dHcAWxZqZl5RfkcCa0f50F3vBXeaKbV/eMDYwNjJ3MXJxCAn8Z5Q4ef00G
 4TznFHixcTPQBkODmEBD4kTeyy6GDk5RAQUJN68uscIUsMs8JRRYtnktSwQDfcZJRq/P2YBqW
 IT0JbYsuUXG4jNK2Ar0djUyQhiswioSHxsXsoEYosKhEu83vSZEaJGUOLkzCcsIMs4gXpvPlM
 FMZkFNCXW79IHqWAWEJe49WQ+E4QtL7H97RxmEFsC6J51Z9qg7ASJnn+P2CYwCs5CMnQWwqRZ
 SCbNQjJpASPLKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNjEyA200us0k3SKy3WLU8tLtE10kssL
 9YrrsxNzknRy0st2cQIjKWUgraOHYzT33zQO8QoycGkJMrLcNghQYgvKT+lMiOxOCO+qDQntf
 gQowwHh5IEL/s7oJxgUWp6akVaZg4wrmHSEhw8SiK8C14DpXmLCxJzizPTIVKnGBWlxHl13gI
 lBEASGaV5cG2wVHKJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvaZApPJl5JXDTXwEtZgJa
 PMvNDmRxSSJCSqqByTSmkMuEV0l7Sq1GgJlJqKr+tOPXnQpVI99+eTtHnF8r61p/fvW7WO0nP
 /d/bjrDt3rLv1WXqi+aLLbqnpmafMOrTTPob8QyrW+bFtfwK3oJvrb1bNGSOhFTsSjJ26Znvn
 TzpjsTVk7Mj+eSqPl4IGn9B+ljwbKrLmxfKnW99bODzg6X14Fp4lc9/y9jE7vbl21knLY5YSv
 LNsX07yu5fH1apus+U2G+sLF6wYplcdpvZ+dmLVVi6Nu2tozvbeEfF6e5u7huLNJtaktNZ70x
 2flYoufxc+K6q/dMu/u/SNnsy6vIX77PfT4sDr7B3MrxQHlLW8bW7dXCMkvl3624uu2bKXNsQ
 G2dU4zWA8Y3SizFGYmGWsxFxYkA0wBmaaADAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-34.tower-346.messagelabs.com!1614868238!45!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24814 invoked from network); 4 Mar 2021 14:30:40 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
 by server-34.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Mar 2021 14:30:40 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 323C072DE5B75D006E9D;
 Thu,  4 Mar 2021 22:30:37 +0800 (CST)
Received: from localhost.localdomain (10.38.54.207) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Thu, 4 Mar 2021
 09:30:35 -0500
Subject: Re: [External] Re: [PATCH] ALSA: hda: ignore invalid NHLT table
To: Takashi Iwai <tiwai@suse.de>
References: <markpearson@lenovo.com>
 <20210302141003.7342-1-markpearson@lenovo.com>
 <420b9b48-0a80-634b-9a98-973c6bdb544c@linux.intel.com>
 <55a6f9e6-17ab-6049-d2e2-5dee1941b539@lenovo.com>
 <s5hft1bb9y0.wl-tiwai@suse.de>
From: Mark Pearson <markpearson@lenovo.com>
Message-ID: <87109afd-a542-3704-1d55-1bc4cc6a45b4@lenovo.com>
Date: Thu, 4 Mar 2021 09:30:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hft1bb9y0.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.54.207]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Philipp Leskovitz <philipp.leskovitz@secunet.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


On 04/03/2021 03:27, Takashi Iwai wrote:
> On Tue, 02 Mar 2021 16:57:43 +0100,
> Mark Pearson wrote:
>>
>> Hi Pierre-Louis,
>>
>> On 02/03/2021 09:46, Pierre-Louis Bossart wrote:
>>> Adding Mark, Takashi, Jaroslav and Cezary in Cc:
>>
>> Thanks - I wasn't sure who needed to be on this :)
> 
> Thanks, applied now.
> 
> Unfortunately the patch conflicted slightly with the recent change by
> Pierre, so I corrected in my side.  Please check it later.
> 
Will do.

Thanks!
Mark
