Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D026BD328
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:15:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2585010FE;
	Thu, 16 Mar 2023 16:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2585010FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979703;
	bh=R1GEBVSX4RmYyh3Vng4K7jNaRTfW7mutv7gR5UToFaQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EPFqpyz9UnqB05M/RAq/WGaNgJ3YtQ2slzBR7EsmiZ6dgqfr3qOqcOsw2TAVa4b7q
	 DU6Be8CqHflC14oKc6ZRWubtwDPlSSs5Znbc51h566khzsG3pb5t2/vIV+BDTnibC/
	 kInmNEmevbsLnRoUEFdRuZlXJSnnQ/yDbxkzwuVM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF66F8052D;
	Thu, 16 Mar 2023 16:12:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7854EF8052D; Thu, 16 Mar 2023 16:12:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AFF4F8051B
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AFF4F8051B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678979553805999041-webhooks-bot@alsa-project.org>
References: <1678979553805999041-webhooks-bot@alsa-project.org>
Subject: Maybe a bug: libasound_module_ctl_pulse.la uses
 snd_pcm_sw_params_get_start_threshold but not linked against -lasound?
Message-Id: <20230316151246.7854EF8052D@alsa1.perex.cz>
Date: Thu, 16 Mar 2023 16:12:46 +0100 (CET)
Message-ID-Hash: J35QBCU2WJPIPPOQXKJG2UERG6RN5SSI
X-Message-ID-Hash: J35QBCU2WJPIPPOQXKJG2UERG6RN5SSI
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J35QBCU2WJPIPPOQXKJG2UERG6RN5SSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #52 was opened from MIvanchev:

I see pcm_pulse.c uses snd_pcm_sw_params_get_start_threshold from -lasound but AFAIK that is a bug, because libasound is loading the plugins and not the other way around.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/52
Repository URL: https://github.com/alsa-project/alsa-plugins
