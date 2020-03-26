Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66667193FF9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 14:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D85166F;
	Thu, 26 Mar 2020 14:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D85166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585230181;
	bh=mYMCME5eE1SS9nJ80OeD1sm+IzL98RYkOvLJVONSUSY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sTuxcRr445iPqLMa54/YZN7x/Cu1wkKfke9+lTT9VZ1xeQePQmh42BQ4r25vnIuq4
	 /BAOoSWWHGkKA7m069VcZpwAXWIKLB2wzRCgViN5W08NkQDOMQT/y0BW4B8+NWhrkk
	 sQ7uSgbrEHnzJA8bugwMVtElcCKebOaiUe6n/zqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6C3CF80095;
	Thu, 26 Mar 2020 14:41:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47CECF80227; Thu, 26 Mar 2020 14:41:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09B4F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 14:41:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09B4F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="KFj51q5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=769; q=dns/txt; s=axis-central1;
 t=1585230076; x=1616766076;
 h=date:from:to:subject:message-id:mime-version;
 bh=stU8o8V/t9duzfgSCNpFxFgf9Cq8DsmpBL2vQ8CG1ic=;
 b=KFj51q5JQEmkLDM0Gw7oXOXT7CXYTQzlUYLWPRwQCWpVt2DJFpUqv/w0
 9/ZuzWNkJ1mjY+rXaJyNbmS7a2UG96UaC3a2avxa7+sVhk8FOcGXv+WpZ
 5oFwj8BSfR029sFm1hJJb53o6tS95KxGhFUELhQL2w5yr+Tho+lyABRnz
 +hf+zwPFkRq8ilQSlV8ngjv/JYYhlPoIG9hq+onKeUtqsxxp7mSYLsxch
 Tb0Z0Mn2JSdDYIaghS3/4kh7tOsZgdguv7fY3YVqc2lEiVGE1YCATT/nh
 N/30sXCrAU8fVspDbe1ao9ZIux6gHfcKBT+8OkQUQt4IU7NqfXLTt/iil A==;
IronPort-SDR: coGAjV5Ly5jqq11+1BQqnsHadyENx8qRuMWJeUVXRJKW1VLkNdxurJqJNk0bPL7p1S+UOhnwLT
 Ys9AMlmskhjqVSxvKbhe4fjjI3lKrJE5eJgZIUr7PGH88c9AYTrH8eR8cARSawgF+cH+e2D1R1
 ZqWjCLw9IZzUiK/zQ2qlOmZyCb4lUu1Kcq9Km86jrQgXwEYzN6o06ySXZoev4fpgPsC0evbb3P
 DA8XlWxEu/Lm+GT0BYG80Qk1MaFEeITR19m4GnP1wxVtxJDKOLJjNT/HvXf53buAbnWYwTd8oS
 bpM=
X-IronPort-AV: E=Sophos;i="5.72,308,1580770800"; 
   d="scan'208";a="6958814"
Date: Thu, 26 Mar 2020 14:41:11 +0100
From: Jonas Holmberg <jonashg@axis.com>
To: <alsa-devel@alsa-project.org>
Subject: route and chmap
Message-ID: <20200326134110.GA3784158@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi,
I use the route plugin to copy mono to both FL and FR (front left and 
front right stereo) of the slave during playback. When get_chmap() is 
called in the route plugin it will call get_chmap() of the slave, 
which returns 2 channels with FL and FR positions, and then route 
itself returns 1 channel with FL position. But the application that 
called snd_pcm_get_chmap() on the playback device expected to get 
position MONO instead of FL since the number of channels is 1.

Is the application wrong in not accepting the chmap or should the 
route plugin have changed position from FL to MONO? Is it possible to 
add something to the config (asound.conf) to make FL become MONO in 
the reply of get_chmap() or solve the problem in any other way?

BR
/Jonas
