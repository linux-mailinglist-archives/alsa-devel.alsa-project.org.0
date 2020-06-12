Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C34B1F7308
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 06:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C67CE1685;
	Fri, 12 Jun 2020 06:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C67CE1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591936262;
	bh=l5nTLUPKowfVK7x8gIr4vWoqYRT9yrYYdCJuIKt8aQ8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTZFMLO3fj5nIK7FKyQe3t0/rakRAq88EDGmNeeWmPxM9lLySWID6hnNzrq8OBqzr
	 BYUf79PIiIVNgFCUlRTHI9meUkEjdGRzgfRb65cndq3a53LJIgshu/mM5bYSveDsE9
	 AZtTCCMuSJju3PyYLQctd0TF/vs32PbsCVopQoTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57EC3F800C7;
	Fri, 12 Jun 2020 06:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AFABF8021C; Fri, 12 Jun 2020 06:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3DA64F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 06:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DA64F80058
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591936141922130108-webhooks-bot@alsa-project.org>
References: <1591936141922130108-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: ctl: obsolete abstract class for snd_ctl_elem_info
 structure
Message-Id: <20200612042912.5AFABF8021C@alsa1.perex.cz>
Date: Fri, 12 Jun 2020 06:29:12 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #32 was opened from takaswie:

In UAPI of Linux sound subsystem, snd_ctl_elem_info structure includes union member.

Current implementation of ALSACtl uses abstract class (ALSACtlElemInfo) and concrete class (ALSACtlElemInfoBool and so on) to represent variation corresponding to each of union member. However, the design pattern is not convenient for some language bindings.

For example, in Rust language, class-based inheritance is not supported. Gtk-rs project produces mechanism to upcast/downcast between super/sub classes and handles GObject class system. In my opinion, the code to upcast/downcast is a bit inconvenient to handle derivatives.

This patchset obsoletes usage of abstract class for ALSACtl. The target is ALSACtlElemInfo. Some APIs are added into the object to retrieve data for integer/integer64/enumerated element type, then the object becomes concrete class.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/32
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/32.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
