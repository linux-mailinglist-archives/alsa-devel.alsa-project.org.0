Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B9290103
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 11:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39C1C17A1;
	Fri, 16 Oct 2020 11:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39C1C17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602839545;
	bh=9DbpOWRuvvuESV/EF17hJ0Kg1saqYX7x6WY+XMwzUPI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dNS3VPBoYYFHSdibf1wq4iP5z7b/ACXyjqR3+jK/H3Y5V+5DY80D04KsIReuacUR5
	 1zCcNc3iComEiNL35D2lz7DX5Z2xtfrQXctFgg2ItLHgKHt/2JRvgCk8g+taS5CPtv
	 HM9rhL91CNjIdYqVzOsnxuRjKehsZictoAToXssc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE68BF8021D;
	Fri, 16 Oct 2020 11:10:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F10F80217; Fri, 16 Oct 2020 11:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95103F800B8
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 11:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95103F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KvFvBNrK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09G9AUP9014238; Fri, 16 Oct 2020 04:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=5GgvYFVOQXr2tlU+lzmQtw6n7e7CS2uC5plEf2o1xhA=;
 b=KvFvBNrKAIUA4F+g8fCFhfAZAXBPLdAhsDpajjHdZHzhvE+51PeJAaGFxsj00FAmf/yv
 cde1yIijg1JeLtvVO5Pp1IO0qYO3YWpNEWvgkS1o1me4exeIb7i4Twc07mPCk6Gcvry6
 xX+jS3bRJjFbRZPBr8bG5p6yiSIaevdcTpId4lSQLoaZZPrwgH0dN8FCozi8Mk0did7t
 oH1rvaK3nbRONs6JGOm4IaThtE3L9sCk9rovyjHFiMbDNK2IMU9WteroHSZ1484mDkTO
 z7g1op4W048AV19gagc/TILN4bu2lN2v/FYzCYMxaJlj1QGTJ50WNeO+gOkE+IIXOLyd vA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3439cnfx63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 04:10:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 10:10:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 10:10:16 +0100
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2283145;
 Fri, 16 Oct 2020 09:10:16 +0000 (UTC)
Subject: Re: [PATCH 1/7] of: base: Add of_count_phandle_with_fixed_args()
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014145418.31838-2-rf@opensource.cirrus.com>
 <CAL_Jsq+qdcHc9H7qUVwLieHrLM8E20HZXa8DkarMiuXfCh8WOQ@mail.gmail.com>
 <90600a67-25e4-7933-35c3-f515deaee94f@arm.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <008108c4-952b-a8a3-af81-af9e40643f36@opensource.cirrus.com>
Date: Fri, 16 Oct 2020 10:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <90600a67-25e4-7933-35c3-f515deaee94f@arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160068
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 - <patches@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM
 ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
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


On 15/10/2020 17:52, Robin Murphy wrote:
> On 2020-10-14 19:39, Rob Herring wrote:
>> On Wed, Oct 14, 2020 at 9:54 AM Richard Fitzgerald
>> <rf@opensource.cirrus.com> wrote:
>>>
>>> Add an equivalent of of_count_phandle_with_args() for fixed argument
>>> sets, to pair with of_parse_phandle_with_fixed_args().
>>>
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> ---
>>>   drivers/of/base.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>   include/linux/of.h |  9 +++++++++
>>>   2 files changed, 51 insertions(+)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index ea44fea99813..45d8b0e65345 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -1772,6 +1772,48 @@ int of_count_phandle_with_args(const struct 
>>> device_node *np, const char *list_na
>>>   }
>>>   EXPORT_SYMBOL(of_count_phandle_with_args);
>>>
>>> +/**
>>> + * of_count_phandle_with_fixed_args() - Find the number of phandles 
>>> references in a property
>>> + * @np:                pointer to a device tree node containing a list
>>> + * @list_name: property name that contains a list
>>> + * @cell_count: number of argument cells following the phandle
>>> + *
>>> + * Returns the number of phandle + argument tuples within a 
>>> property. It
>>> + * is a typical pattern to encode a list of phandle and variable
>>> + * arguments into a single property.
>>> + */
>>> +int of_count_phandle_with_fixed_args(const struct device_node *np,
>>> +                                    const char *list_name,
>>> +                                    int cells_count)
>>> +{
>>
>> Looks to me like you can refactor of_count_phandle_with_args to handle
>> both case and then make this and of_count_phandle_with_args simple
>> wrapper functions.
> 
> Although for just counting the number of phandles each with n arguments 
> that a property contains, isn't that simply a case of dividing the 
> property length by n + 1? The phandles themselves will be validated by 
> any subsequent of_parse_phandle*() call anyway, so there doesn't seem 
> much point in doing more work then necessary here.
> 

As I'm not a DT expert, I'm reluctant to change existing algorithms that
could break everything just for the trivial case of adding a fixed
arguments count. I have a re-worked patch as suggested by Rob that
re-uses the existing counting function for both cases.

>>> +       struct of_phandle_iterator it;
>>> +       int rc, cur_index = 0;
>>> +
>>> +       if (!cells_count) {
>>> +               const __be32 *list;
>>> +               int size;
>>> +
>>> +               list = of_get_property(np, list_name, &size);
>>> +               if (!list)
>>> +                       return -ENOENT;
>>> +
>>> +               return size / sizeof(*list);
> 
> Case in point - if it's OK to do exactly that for n == 0, then clearly 
> we're *aren't* fussed about validating anything, so the n > 0 code below 
> is nothing more than a massively expensive way to check for a nonzero 
> remainder :/
> 
> Robin.
> 
>>> +       }
>>> +
>>> +       rc = of_phandle_iterator_init(&it, np, list_name, NULL, 
>>> cells_count);
>>> +       if (rc)
>>> +               return rc;
>>> +
>>> +       while ((rc = of_phandle_iterator_next(&it)) == 0)
>>> +               cur_index += 1;
>>> +
>>> +       if (rc != -ENOENT)
>>> +               return rc;
>>> +
>>> +       return cur_index;
>>> +}
>>> +EXPORT_SYMBOL(of_count_phandle_with_fixed_args);
>>> +
>>>   /**
>>>    * __of_add_property - Add a property to a node without lock 
>>> operations
>>>    */
>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>> index 5cf7ae0465d1..9f315da4e9da 100644
>>> --- a/include/linux/of.h
>>> +++ b/include/linux/of.h
>>> @@ -377,6 +377,8 @@ extern int of_parse_phandle_with_fixed_args(const 
>>> struct device_node *np,
>>>          struct of_phandle_args *out_args);
>>>   extern int of_count_phandle_with_args(const struct device_node *np,
>>>          const char *list_name, const char *cells_name);
>>> +extern int of_count_phandle_with_fixed_args(const struct device_node 
>>> *np,
>>> +       const char *list_name, int cells_count);
>>>
>>>   /* phandle iterator functions */
>>>   extern int of_phandle_iterator_init(struct of_phandle_iterator *it,
>>> @@ -886,6 +888,13 @@ static inline int 
>>> of_count_phandle_with_args(struct device_node *np,
>>>          return -ENOSYS;
>>>   }
>>>
>>> +static inline int of_count_phandle_with_fixed_args(const struct 
>>> device_node *np,
>>> +                                                  const char 
>>> *list_name,
>>> +                                                  int cells_count)
>>> +{
>>> +       return -ENOSYS;
>>> +}
>>> +
>>>   static inline int of_phandle_iterator_init(struct 
>>> of_phandle_iterator *it,
>>>                                             const struct device_node 
>>> *np,
>>>                                             const char *list_name,
>>> -- 
>>> 2.20.1
>>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
