Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3425AF7B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16DF51850;
	Wed,  2 Sep 2020 17:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16DF51850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599061184;
	bh=0naeiIRPUqcMGm3YwKR8T3w6GAHDh21uvIk5OiuBsOY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXu9i3zjzNFYjikHil9DOvh6vYq4Z0DZl+d3J1j4oYYI6btfHUuojtEVCyHQHGyHQ
	 TPY8ZpjOO2ADfHQfHR0hS7sjDC4ISDMt29wTzLoLZ6qUSLG+Pv15qTtw+Y8ZlP5Jn2
	 lQJTQOqq1b/LmfaGpjwm9QANpTdtnvCg+eGWV+60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 279BEF800BA;
	Wed,  2 Sep 2020 17:38:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C2DF8024A; Wed,  2 Sep 2020 17:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528A4F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528A4F800BA
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kDUnK-009LqU-QO; Wed, 02 Sep 2020 15:35:30 +0000
Date: Wed, 2 Sep 2020 16:35:30 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: general protection fault in snd_ctl_release
Message-ID: <20200902153530.GK1236603@ZenIV.linux.org.uk>
References: <000000000000c15ee205ae4f2531@google.com>
 <s5h36409pbb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h36409pbb.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, maz@kernel.org, tiwai@suse.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dan.carpenter@oracle.com
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

On Wed, Sep 02, 2020 at 05:22:00PM +0200, Takashi Iwai wrote:

> Marc, Al, could you guys check this bug?

That's racy; the first one should be get_file_rcu() instead of
file_count()+get_file(), the second is not needed at all (we
have the file pinned down by the caller).  See vfs.git#work.epoll
for fix
