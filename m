Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C860984F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 04:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918818EA1;
	Mon, 24 Oct 2022 04:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918818EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666579348;
	bh=UlcDjr7abrYF5GHuc1hbHX1VcKxpZJ+l2hg4bLKvc5M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UXDq5/ld1dkC4h2Bs8AQIPZyHQYBuKEgzU4pCjZv0PGh8u4nkLo3M1W0bTAbc+Faw
	 ujioeevyw4MDUG9P4HDuasWWw1WeV7+H0RcMjqyLghN043ZAqeqn8jMsUsn3REH//P
	 LVjDdJPIvquMjqeYiu+JLh6+uurgOxe4ZT5adX6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B262F803DB;
	Mon, 24 Oct 2022 04:41:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7BD8F802E3; Mon, 24 Oct 2022 04:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by alsa1.perex.cz (Postfix) with SMTP id D2059F80107
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 04:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2059F80107
Received: from AEPW014EEK (unknown [10.28.61.203])
 by master-mail (Coremail) with SMTP id AQAAfwBHVvg_+1VjbaQIAA--.31255S2;
 Mon, 24 Oct 2022 10:41:07 +0800 (CST)
From: <wangweidong.a@awinic.com>
To: "'Mark Brown'" <broonie@kernel.org>
Subject: Discuss to review question [PATCH V2 1/2] ASoc:codes:Add Awinic
 AW883XX audio amplifier driver
Date: Mon, 24 Oct 2022 10:41:03 +0800
Message-ID: <000701d8e752$11f78bc0$35e6a340$@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjnUbkP1aSO9lODRxuWfw218aioPA==
Content-Language: zh-cn
X-CM-TRANSID: AQAAfwBHVvg_+1VjbaQIAA--.31255S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw47KFW5uFW5Kr1rWr48WFg_yoW8ZFWkp3
 9I9w1YvFWvqw1rXFy8JrZayF4SvF40ga98Xry8Zr95AryYvr9aqF1xKrWYgry8GFyxAF40
 vF4jg3s5Aw4rA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9q14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwAKzVCY07xG64k0F24lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026x
 CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
 JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
 1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
 WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
 4UJbIYCTnIWIevJa73UjIFyTuYvjfUOxhLUUUUU
X-CM-SenderInfo: 5zdqw4phlg00vjodqt5zlqxuoofrz/
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 duanyibo@awinic.com, liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_potturu@quicinc.com
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
   First of all, thank you for your review. 
   I still have a question I'd like to discuss with you


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

> Please fix your mail client to clearly identify quoted text, as you can
see above it's very dificult for me to tell where you've replied to my mail.

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

> Then it's not a mute function, the goal of the mute function is to run
before all the power management code to minimise glitches during power
management.  Just implement the power management via the standard ASoC power

> management APIs.

The essence of calling mute is not switch dsp, but switch PA. We think that
PA has only two states. When no audio stream enters, turn off the PA and
turn off the PA's dsp. When the audio stream enters, the PA is turned on,
and the dsp is turned on at the same time


Best regards

Weidong Wang

