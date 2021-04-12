Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D235BA44
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 08:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9CA822;
	Mon, 12 Apr 2021 08:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9CA822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618210027;
	bh=9w6kFlIY9YOiKZoDnKLH/ZFw9mKhsOy523LV0psgyIA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIzCy5V65SpjmGQD8TJ9+9aoDOICqoT5KJF6Ffk+vSgjEeeugz2oq5dYxeDqKnZWa
	 6J2p/cdnZyyDcEhPw3i3meW3YIJsnKe1ERrN1n++rNgVXBNMcb4Afb+ixSIvql/yT9
	 ZHWVeCg2G1ATeGg3KnjDA2G7s5T7IwPUU346ra1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B40F800D3;
	Mon, 12 Apr 2021 08:45:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42EB5F800D3; Mon, 12 Apr 2021 08:45:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86E6AF800D3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 08:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86E6AF800D3
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJfLK3pNmzpXZM;
 Mon, 12 Apr 2021 14:42:33 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0;
 Mon, 12 Apr 2021 14:45:19 +0800
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas, rsnd: Clear warning
 'ports' does not match any of the regexes
To: Rob Herring <robh@kernel.org>
References: <20210331091616.2306-1-thunder.leizhen@huawei.com>
 <20210331091616.2306-3-thunder.leizhen@huawei.com>
 <20210401202056.GA947212@robh.at.kernel.org>
 <a1aed23d-a9d2-5e05-b1f5-3b48ac8d17f1@huawei.com>
 <15a406ba-b288-c98c-46f1-36933c11fb11@huawei.com>
 <20210408204212.GA1924190@robh.at.kernel.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <4afb560b-6696-e4e0-09f7-39a768c4c5b8@huawei.com>
Date: Mon, 12 Apr 2021 14:45:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210408204212.GA1924190@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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



On 2021/4/9 4:42, Rob Herring wrote:
> On Thu, Apr 08, 2021 at 08:28:08PM +0800, Leizhen (ThunderTown) wrote:
>>
>>
>> On 2021/4/7 10:04, Leizhen (ThunderTown) wrote:
>>>
>>>
>>> On 2021/4/2 4:20, Rob Herring wrote:
>>>> On Wed, Mar 31, 2021 at 05:16:16PM +0800, Zhen Lei wrote:
>>>>> Currently, if there are more than two ports, or if there is only one port
>>>>> but other properties(such as "#address-cells") is required, these ports
>>>>> are placed under the "ports" node. So add the schema of property "ports".
>>>>
>>>> A given binding should just use 'ports' or 'port' depending on it's 
>>>> need. Supporting both forms is needless complexity.
>>
>> Hi Rob:
>> I don't think of a good way to avoid "port" and "ports" to be used at the same time.
>> Should I disable the use of "port"? Convert the two usages of "port" into "ports".
>> But usually no one will use both of them in one dts file. And even if it's used at
>> the same time, it's not a big mistake. So I decided not to test it.
> 
> I think the Renesas folks need to comment on this.

Hi All:
  I've figured out a way to avoid both. I'll send v3 right away.

> 
> Rob
> 
> .
> 

