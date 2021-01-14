Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9802F610F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 13:33:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A824916AF;
	Thu, 14 Jan 2021 13:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A824916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610627605;
	bh=QmyylMRSGWRs3uiPg1c9qDqkdSfp+3m6a5Bc6zsF5Y4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyY5Uk9iM4eN42IVXfgBe+aP/VMlyVVMoZ9aWlSUiX1/NHcRWyW1iJzA0eiaPK3Fj
	 PJPTO5ht0TqR5Gsfw75Ho+e3OJp30hSJmtmLFotRmTE9B+igmdQTQS/1w/kc7jQ6Us
	 d3cUV3OwXIasAZlcYsuS84Tlt5uAkAy/k1EFh8+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16B31F80134;
	Thu, 14 Jan 2021 13:31:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B0FCF8025E; Thu, 14 Jan 2021 13:31:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A31B0F80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 13:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A31B0F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qIAu7gXI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10ECMnDx000342
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 06:31:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=oBz/FZz9t2FtbydZ1jMYA9xi6P1DrLld6Rncokf0O6c=;
 b=qIAu7gXIvqKRvNOt/YiBuJWt9rkTJn+HGhFivOmJriWIgBP2U5Oe1PkInwNXrsaZow4R
 T2T5gGpEpLUh20lDlYxFN+op8wAERX46V+kxFTAJMvpAVE1kCZ1esvEZgPbVYmllZJiE
 mSiZwBI71ed9DnSEbuh77jwFMBFIKwYaP8TAgbTGt1qaeTzN32KBm93sQ3RfhIZ3WdJt
 9Ol6mGYULzjU7NNBCB6W8/PoxMYEnvUtMhZQLeHE7UOyVVJHfeskQ/MXfzmtvzQErp4/
 HWXbIVX02pGB0HZxIo7Fuduf7t+fI9agFnWAK1hKP04XmYC7u+yiTbTE3aqNxzT3Q4zN jg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35y9srx7xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 06:31:42 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 14 Jan
 2021 12:31:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 14 Jan 2021 12:31:41 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.57])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31D5B2AB
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 12:31:41 +0000 (UTC)
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
To: <alsa-devel@alsa-project.org>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
 <20210113152225.GA2334778@robh.at.kernel.org>
 <c12a846f-9e79-4646-e7f4-397f074eb613@opensource.cirrus.com>
 <20210114111422.GA4854@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <240f974b-f546-f51d-2499-514680a82c35@opensource.cirrus.com>
Date: Thu, 14 Jan 2021 12:31:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114111422.GA4854@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=617 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140074
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

On 14/01/2021 11:14, Mark Brown wrote:
> On Thu, Jan 14, 2021 at 10:31:10AM +0000, Richard Fitzgerald wrote:
>> On 13/01/2021 15:22, Rob Herring wrote:
> 
>>> This appears to all be configuration of clocks within the codec, so
>>> these properties belong in the codec or cpu nodes.
> 
>> audio-graph-card doesn't have codec or cpu nodes. Those were in
>> simple-card but are replaced in audio-graph-card by a simple phandle
>> array forming a graph.
> 
>> I could assume that all clock settings apply to the codec and that there
>> is only ever one codec in an audio-graph-card configuration.
> 
> The suggestion here is to put properties in the node for the relevant
> device rather than the card.
> 

That's seems bad to me - putting the properties for one driver in the
node of another driver. It's also potentially misleading as an example.
As in something like:

   wm5102: wm5102 {
	compatible = "wlf,wm5102";

	sysclks = <&some_clock>;
	plls = <&some_other_clock>;

	...
   };

To me that seems to imply that these are properties of the wm5102 driver
and it is going to setup its own sysclk and pll settings from those
properties. But actually it's the machine driver that does it, and these
properties are specific to audio-graph-card.
