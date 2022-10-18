Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76D7605CE3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7543FC7;
	Thu, 20 Oct 2022 12:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7543FC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262299;
	bh=toWONRPVRyvli0SmA4914dVz6rTlI9dw3LXibjppbHA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rzgq7Fs/cyUtubb+9OiwyqRo4Vc4nkC1ffpj5Rb/J+tblgA6kKNGDCkE+1B5FvW8X
	 TtRCJlw5/Uy/gA/AglzE7iJqIsYgUu+j5Mu51gpk7vy0BbpFInqB5M/R9nOnaqiUO/
	 EdI74EEAKJjzr9o6b4e4PJHpMG/Jx0BCYhTbmsm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7947AF805B3;
	Thu, 20 Oct 2022 12:33:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF2AF804BD; Tue, 18 Oct 2022 05:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from zg8tmtm4lje5ny4xodqumjaa.icoremail.net
 (zg8tmtm4lje5ny4xodqumjaa.icoremail.net [138.197.184.20])
 by alsa1.perex.cz (Postfix) with SMTP id AC5C2F800AA
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 05:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5C2F800AA
Received: from AEPW014EEK (unknown [10.28.61.203])
 by master-mail (Coremail) with SMTP id AQAAfwAnNvhcIk5jAl0DAA--.13022S2;
 Tue, 18 Oct 2022 11:49:53 +0800 (CST)
From: <wangweidong.a@awinic.com>
To: "'Mark Brown'" <broonie@kernel.org>
Subject: Thanks to review question [PATCH V2 1/2] ASoc:codes:Add Awinic
 AW883XX audio amplifier driver
Date: Tue, 18 Oct 2022 11:49:48 +0800
Message-ID: <007b01d8e2a4$ae59bc20$0b0d3460$@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjipJzgBRqHuVmnSq+4eZlKAbHOow==
Content-Language: zh-cn
X-CM-TRANSID: AQAAfwAnNvhcIk5jAl0DAA--.13022S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw17WF18JFWDJr1DKF17ZFb_yoW8Kry8pa
 9Ikr1SkF4vqr4rXFykJrZ2kF1SvF409an8XrykZr95Jryavr9ayF1xKrWYgryxCFy7AF4Y
 vF4jgas8Zws5ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxV
 CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
 6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
 WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
 6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbveHDUUUUU==
X-CM-SenderInfo: 5zdqw4phlg00vjodqt5zlqxuoofrz/
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:17 +0200
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
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

HI: Mark Brown

Thank you very much for your help. I will correct these problems.

Best regards,
Weidong Wang





On Mon, Oct 17, 2022 at 04:09:12PM +0800, wangweidong.a@awinic.com wrote:
> Hi: Mark Brown
> 
> Thank you for your suggestion. I will fix the problem you raised in 
> the next patch, but there is still a question here and I want to 
> discuss it with you
> 
> This is rather too big to go through in one go so the review here is 
> very high level but that's probably a good level for initial review 
> here as there

Please fix your mail client to clearly identify quoted text, as you can see
above it's very dificult for me to tell where you've replied to my mail.

> > +	if (mute) {
> > +		aw883xx->pstream = AW883XX_STREAM_CLOSE;
> > +		cancel_delayed_work_sync(&aw883xx->start_work);
> > +		mutex_lock(&aw883xx->lock);
> > +		aw883xx_device_stop(aw883xx->aw_pa);
> > +		mutex_unlock(&aw883xx->lock);
> > +	} else {
> > +		aw883xx->pstream = AW883XX_STREAM_OPEN;
> > +		mutex_lock(&aw883xx->lock);
> > +		aw883xx_start(aw883xx, AW_ASYNC_START);
> > +		aw883xx_hold_dsp_spin_st(&aw883xx->aw_pa->spin_desc);
> > +		mutex_unlock(&aw883xx->lock);
> > +	}
> 
> This doesn't look like a mute operation, it looks like it's starting 
> and stopping the DSP.
> 
> Answer: This is a mute operation ,aw883xx_device_stop is called in th 
> aw883xx_mute function. This function not only executes the mute 
> function aw883xx_dev_mute, but also disables dsp and power down. This 
> is for the aw883xx chip low power optimization.

Then it's not a mute function, the goal of the mute function is to run
before all the power management code to minimise glitches during power
management.  Just implement the power management via the standard ASoC power
management APIs.

> > +	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], true);
> > +
> > +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> > +	return 0;
> > +}
> 
> If a control write changes a value it should return 1, you should run 
> the mixer-test selftest which will identify this and a number of other
issues.

tools/testing/selftests/alsa

> Answer: Could you tell me what is mixer-test selftest? I have checked 
> other drivers, and there is no return 1.

Are you *sure* there's none?  Other drivers being buggy isn't a good reason
to introduce more bugs.

