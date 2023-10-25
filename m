Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B257D65FE
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 11:00:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE1864E;
	Wed, 25 Oct 2023 10:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE1864E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698224421;
	bh=61+WbqVBHv9kUew8VX7k7+FvZJvSSWLBI9FDordRr3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EmzCBLTX7FBOvAp60BtOhrEV4K88nzq4iYsRXzLptu/i1ULBqDjQIEIKLWjHEu5lZ
	 +zVqnIS+li4jmpno//ImkKhrLnxV2Fjn4N/LGug2OObGG1LRVD+NaiTtIck7ZtV+RM
	 hIQcuJIVGB8x4tihnFWAHzAkc5yiRUTxfQ2p4s3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 473BEF8019B; Wed, 25 Oct 2023 10:59:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4680F80157;
	Wed, 25 Oct 2023 10:59:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CACF80165; Wed, 25 Oct 2023 10:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-147.mail.aliyun.com (out28-147.mail.aliyun.com
 [115.124.28.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A07DCF8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 10:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A07DCF8012B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.07707555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0251605-0.000177189-0.974662;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.V7kMlT4_1698224337;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V7kMlT4_1698224337)
          by smtp.aliyun-inc.com;
          Wed, 25 Oct 2023 16:59:05 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: 13916275206@139.com,
	ajye_huang@compal.corp-partner.google.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	devicetree@vger.kernel.org,
	harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V2 3/4] ASoC: codecs: Add code for bin parsing compatible
 with aw88399
Date: Wed, 25 Oct 2023 16:58:56 +0800
Message-ID: <20231025085857.918695-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <06c14b04-28df-4374-80e3-91e40bc53a84@sirena.org.uk>
References: <06c14b04-28df-4374-80e3-91e40bc53a84@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q5YLSUOUODP7SR2A44S7PUR2OOEFT5UC
X-Message-ID-Hash: Q5YLSUOUODP7SR2A44S7PUR2OOEFT5UC
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5YLSUOUODP7SR2A44S7PUR2OOEFT5UC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your help.

On Tue, Oct 24, 2023 at 14:57:03 +0100, Mark Brown wrote:
> On Tue, Oct 24, 2023 at 01:42:13PM +0100, Mark Brown wrote:
>> On Tue, Oct 24, 2023 at 03:19:28PM +0800, wangweidong.a@awinic.com wrote:
>> 
>> > I generated the patch based on the mainline branch, 
>> > Why would there be a conflict? I know that I made a change to
>> > this file when I committed aw87390 and that 
>> > the change was in the Linux-next branch, but the two 
>> > changes are in different parts of the file.
>> 
>> I don't know off hand, I didn't check in detail.  It's possible someone
>> else sent a fix that's been applied and is causing the issue - if you
>> check out my branch and try to apply the patches hopefully you can
>> figure out what the problem was.

> diff --cc sound/soc/codecs/aw88395/aw88395_lib.c
> index a0a429ca9768,bc72a7487048..000000000000
> --- a/sound/soc/codecs/aw88395/aw88395_lib.c
> +++ b/sound/soc/codecs/aw88395/aw88395_lib.c
> @@@ -705,7 -703,8 +705,12 @@@ static int aw_dev_load_cfg_by_hdr(struc
>  
>  	switch (aw_dev->chip_id) {
>  	case AW88395_CHIP_ID:
> ++<<<<<<< HEAD
> +		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, all_prof_info);
> ++=======
> + 	case AW88399_CHIP_ID:
> + 		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
> ++>>>>>>> ASoC: codecs: Add code for bin parsing compatible with aw88399
>  		if (ret < 0)
>  			goto exit;
>  		break;

Again, thank you very much for your help. I'll resend the patch
based against for-6.7 of sound tree.

Best regards
Weidong Wang
