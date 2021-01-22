Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE23003BD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 14:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6119A1ED8;
	Fri, 22 Jan 2021 14:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6119A1ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611320761;
	bh=Cl3L0C1dFuJPEJcpxcZymb+1OlKin/saLEaRojgn+/w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8lUazF3WwzNHPuTRGT6HeEIkpCgoio8O9YCzlMVzwbBhGxJHd39jc1ajOdrL5Mg0
	 U1yxCJi1ZFF3EsiNZfYarRe8lSLEkBr8O2SUIqX4X78If+fqpX0eHSQqojUdrUUwy2
	 7TivM1YO5kTxYxshVzKfsBWEj2NQTolY4Dn6uQeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F8FFF8019B;
	Fri, 22 Jan 2021 14:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53514F8016E; Fri, 22 Jan 2021 14:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 823E6F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 14:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 823E6F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oYyjIQn7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MD2jtb012226; Fri, 22 Jan 2021 07:04:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yce91SwW/9Sjkp7mVxwKLT9AOFwoVPrBwfeXugarwdQ=;
 b=oYyjIQn7JYs+8M1e5YEKav+d2LTp8eQ3upSenCCJ3xrzFRYAsbbzC3Z0E0xmd8ah1O6G
 cdjwNQeDjij+YBgXLytVRFhNRnm9gzDfbr+agMUAYnoPd39tVDr793s1vztmdjfE9UES
 xe+0NIH8a5JJkiykdB7fgesa6KwBh/nlryYUSdjuEEG2A4a53p3rxQR8K/Jh0rgWxZ8q
 hS/tvtXnHYadGnICCtpFiFgk0o+lni2ULbWfJzoGgSgNi/LUA61W0RRw5fs2OTMMUEcK
 JgVqzLb3H5Co6T+ZDjfwFFiQUtNNVotP1gigqRyFXXYVwqst6P4hkRfOxyQ9aI0iM1xh Zw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36692rbnp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 22 Jan 2021 07:04:15 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 22 Jan
 2021 13:04:13 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 22 Jan 2021 13:04:13 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A703E45;
 Fri, 22 Jan 2021 13:04:12 +0000 (UTC)
Date: Fri, 22 Jan 2021 13:04:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 08/12] ASoC: arizona-jack: convert into a helper
 library for codec drivers
Message-ID: <20210122130412.GI106851@ediswmail.ad.cirrus.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-9-hdegoede@redhat.com>
 <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
 <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
 <5c1f181f-f074-397d-cdba-d37ab58f9a2b@redhat.com>
 <20210122112607.GH106851@ediswmail.ad.cirrus.com>
 <4274589c-9a52-7f1a-f937-1c5d60b76559@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4274589c-9a52-7f1a-f937-1c5d60b76559@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=971 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220071
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Jan 22, 2021 at 01:23:44PM +0100, Hans de Goede wrote:
> On 1/22/21 12:26 PM, Charles Keepax wrote:
> > On Thu, Jan 21, 2021 at 05:55:00PM +0100, Hans de Goede wrote:
> >> On 1/19/21 10:51 AM, Richard Fitzgerald wrote:
> >>> On 18/01/2021 17:24, Andy Shevchenko wrote:
> >>>> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> Note there is a pretty big issue with the original code here, if
> >> the MICVDD DAPM pin is on for an internal-mic and then we run through the
> >> jack-detect mic-detect sequence, we end up setting
> >> bypass=true causing the micbias for the internal-mic to no longer
> >> be what was configured. IOW poking the bypass setting underneath the
> >> DAPM code is racy.
> >>
> > 
> > The regulator bypass code keeps an internal reference count. All
> > the users of the regulator need to allow bypass for it to be
> > placed into bypass mode, so I believe this can't happen.
> 
> Ah I did not know that, since the regulator_allow_bypass function
> takes a bool rather then having enable/disable variants I thought
> it would directly set the bypass, but you are right. So this is not
> a problem, good.
> 
> So this has made me look at the problem again and I believe that
> a much better solution is to simply re-use the MICVDD regulator-reference
> which has been regulator_get-ed by the dapm code when instantiating the:
> 
> SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),
> 
> widget. So I plan to have a new patch in v3 of the series which replaces
> the devm_regulator_get with something like this:
> 
> 	/*
>  	 * There is a DAPM widget for the MICVDD regulator, since
> 	 * the button-press detection has special requirements wrt
> 	 * the regulator bypass settings we cannot directly
> 	 * use snd_soc_component_force_enable_pin("MICVDD") /
> 	 * snd_soc_component_disable_pin("MICVDD").
> 	 *
> 	 * Instead we lookup the widget's regulator reference here
> 	 * and use that to directly control the regulator.
> 	 * Both the regulator's enable and bypass settings are
> 	 * ref-counted so this will not interfere with the DAPM use
> 	 * of the regulator.
> 	 */
> 	for_each_card_widgets(dapm->card, w) {
> 		if (!strcmp(w->name, "MICVDD"))
> 			info->micvdd_regulator = w->regulator;
> 			break;
> 		}
> 	}
> 
> (note I've not tested this yet, but I expect this to work fine).
> 

Alas this won't work either. When I say reference count that
isn't quite a totally accurate reflection of the usage of the
function. When you call allow_bypass you are saying as this
consumer of the regulator I don't mind if it goes into bypass.
Then if all consumers agree the regulator will be put into
bypass. So it is comparing the reference count to the number of
consumers the regulator has to make a decision.

If you call allow_bypass independently from the jack detection
code and the ASoC framework on the same consumer, as you
describe here you will get bad effects.  For example the
regulator has two consumers, our CODEC driver and some other
device. If our codec driver calls allow_bypass twice, then
the regulator would go into bypass without the other consumer
having approved it would could be fatal to that device.

Thanks,
Charles
