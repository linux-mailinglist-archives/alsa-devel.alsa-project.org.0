Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA260EDDC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 04:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C412C3590;
	Thu, 27 Oct 2022 04:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C412C3590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666837252;
	bh=GVajGLn1FqVT/x9QikxUtJkjt/ume6dfdK0LAX1yjYU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SSEgUTHJNNGNx5e5PPHJnqWPenUa4X4RDlai9TvbyXg63Ggyv3RSrtbu2XT7Qa/J9
	 uhPYkmXBQ6vWsOr0KGfPLWiJGNIe27BdRoPIZU8AD0pKBncvOLVg8KsrTQcgVtKa3h
	 VfW8iLXdKPZZkWzdQAdO3FXOn4Z3jr6X++YxNOII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D715F80496;
	Thu, 27 Oct 2022 04:19:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 148ABF8016C; Thu, 27 Oct 2022 04:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [207.46.229.174])
 by alsa1.perex.cz (Postfix) with SMTP id C93DDF8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 04:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93DDF8016C
Received: from AEPW014EEK (unknown [10.28.61.203])
 by master-mail (Coremail) with SMTP id AQAAfwA3Rvi56lljjrgKAA--.37296S2;
 Thu, 27 Oct 2022 10:19:41 +0800 (CST)
From: <wangweidong.a@awinic.com>
To: "'Mark Brown'" <broonie@kernel.org>
Subject: Thanks to review question [PATCH V2 1/2] ASoc:codes:Add Awinic
 AW883XX audio amplifier driver
Date: Thu, 27 Oct 2022 10:19:37 +0800
Message-ID: <000801d8e9aa$92b88cf0$b829a6d0$@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjpqgjldrbhAobBTLyetjRgNsR+IA==
Content-Language: zh-cn
X-CM-TRANSID: AQAAfwA3Rvi56lljjrgKAA--.37296S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1fJF4kAr15CFyDCrykKrg_yoWkJrg_ua
 s3tw4kZw1UKry5Aa13KayUAF17Kr4kZFy7JF45X34xtr1rZa98AFWDur92grW8XFWUJryq
 9Fn8trWavryaqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb-kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
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

Hi Mark Brown

Thank you for your valuable advice to let me understand the problem.
I will fix this issue in the next patch

Best regards
Weidong Wang

On Mon, Oct 24, 2022 at 10:41:03AM +0800, wangweidong.a@awinic.com wrote:

> > Then it's not a mute function, the goal of the mute function is to 
> > run
> before all the power management code to minimise glitches during power 
> management.  Just implement the power management via the standard ASoC 
> power
> 
> > management APIs.

> The essence of calling mute is not switch dsp, but switch PA. We think 
> that PA has only two states. When no audio stream enters, turn off the 
> PA and turn off the PA's dsp. When the audio stream enters, the PA is 
> turned on, and the dsp is turned on at the same time

> That's not what the mute function is for, the interface is specifically
for muting the stream while power management changes are 
> going on.  What you're describing is power management so should be
controlled via DAPM.
> If your device doesn't have any support for a separate mute function then
it should just not implement anything for that in the 
> driver.

