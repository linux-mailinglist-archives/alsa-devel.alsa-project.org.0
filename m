Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D060014466A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 22:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D72165F;
	Tue, 21 Jan 2020 22:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D72165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579642155;
	bh=J/121S0M0SzxzTXfxkwdq1laAss6pBqAFrqPY3ghF4k=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ryU+YVGf1Gq8RfEDxNWp9NBYLqKD8zl2e+noEAb07shH+sCQql8tkqRQSx+m4Z8FH
	 X/TCemd/jl4rvN8pgrH13T95lt+OoOCRYKF85VMXbYLK9lLKlE+OYY+VjZW9p2qiEe
	 S5z/afBPtaCtGhUUV2F3av7VvqVGxyIW3F897CEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA8FF801EC;
	Tue, 21 Jan 2020 22:27:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9898F801D9; Tue, 21 Jan 2020 22:27:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B2F4F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 22:27:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B2F4F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="JYH+X/QZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1579642042;
 bh=MItQ0CGsT4fZJg0jqQ4F+6jtgl/6EP000c4bcNY3S5E=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=JYH+X/QZ++sUpDU+0fEMl/hu9lHes9dBJe2AXtBmCUvfma4ltMMpdJlJX9K3XMTDx
 T8N6PMMKn/vkjXAcz/RcU+tzkQiV5F+Z7ah2TnXW8w0cSxnCX6vBcIzttoawNLg5dj
 wtdcChJC+UZ9bR45YFThJ0A6f1otRehZJNTqUHj0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.56] ([89.245.43.201]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8ofO-1jeoP62Q6g-015of1 for
 <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 22:27:22 +0100
To: alsa-devel@alsa-project.org
From: Florian Sauter <unknownstrangersmail@gmx.de>
Message-ID: <952999ca-08a4-c71d-c269-5477854b2a92@gmx.de>
Date: Tue, 21 Jan 2020 22:27:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:QQMS5GSMMPljMGS0XO9MkuRZ4nr8MOqGbI4oXlhwprh0LL2c5AQ
 xYa0W0RtaYMu5IJq4iWDfzIHJ4SdRmo+1Krf25I2H2WRBhE2fUNey9aLdL0iyyuy089xY+V
 e+qVWkt4mEVr/x2naTJidE8Qe8bH+BUWsOMj18kVChYd4n1B664ub5QIH1nJAvtMUCeV+U6
 XJ4UBoOCSDjU/vdhnwZoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:41ygS6SZWYM=:bIZW9Lp31Tt2ERN9ww+WSn
 gsDlBby+pr9YCGz+KcsjYAcydSbrYoYnSDd/9r/+H6E/sIBMyEQRCzzZOk+rQ27KXiTbEbWOd
 f+Ws+Wz9MHIKQ1Q1axXMOFWx0zXfQlkmA4c4H7QUeP6v8meMVzf3+yafaaD0w2qz83nfvk6P3
 76s60yYdAqXvZi66O1sSMF9ofbLpO+LaK1AQpQpT/+e92kv3JLl3OsN5v7axu0DJDPgzAz6NY
 Yv1tEqp+/d6aKDso+6N4RV5PKqZCgN6DnfBIHkQVEJ59eOuiC6WyVwSQHjU9IDB97ZTK333ur
 bhZ5XLCtwYDz/YwS9neduT5IevroEBUwIgn7HKe3UZLFS2MqseC4ku9BhpbIE/Pt9A2cn225e
 wVZ1wAxNqHb4W43buFRqf2p2DSvK6HjAcW3pvTfEtMUV97jwbVhMzwBp1j71pXyYN0ltRyAkr
 JX86shUMc617+a093cGoVHkWMfoUNn+wnNn/U+iAW0KSGdcoAiC9y6KmUi7IdbZvycn5tVtZp
 /HLgl+zSUUzTDrkJz2Pgk74Y16h1RdidgNBreOxWE4/P8uDrVrlvHEl6SZplcXr/TgU7YHUQ/
 0wYb5FSfE3zr3Yndjjh/4e4aniWhGAeQVWmla0l75/UPTL6IQsUeCboOZTZTw3Gjcq6FSE+Ns
 gP+AQLqmePuxezMnleA+Ip2YLebUo/Kaj6/rk51YJE/lFfm+ejeY6JTEIXpfGTRQMuOy0E9RS
 NYIo3YIBPouA17aH7XU0PJpyMyWZT7YghMIvogP1KbelbdnKvdtbPHFbLQd/r2fy2DIqY3ey8
 iH89GbFKamv2dY0c8aMxkoE5ZGt0wFAam4MvXJSLHI3VsCTBRbLDI40Py+f/HmsqcjHKEZhqh
 DfT6yRU8CWI47ZArg7rT851t+7agakiDa91JOedOT06BKr1Ew8gidjmDXIfGx3hzXsQx9HhDH
 s6dSCN0MWJ+yexgcIXUx8l2YsoUOC6O//FXxjJfP98kIfGWcObjz3MrdCOVBwsXWwRygIDMeu
 JYd3kW6/L8zglhfTcVno3fRdvJF4J6EykRx+2BMm5Oc/fFhVv6f8wSRL1Cflwuinly5DGjfb0
 ylHSvq9LzbpldN+sFso0MnypgL5jxMYBiENuqytc3nZhtxGHUy1nmzlI8tJqLJL+94c1YafUb
 O/xZTRa7X7/x9ojjkiMVtSLHFXnSdFRC15QxxHLeWJ92zOtDZ/muU+P25un8fUxexFD8kN5mr
 gWuTSr7kijU2n70YjUscn0csQyueFdAC0MPHmAhXwnFjMIv3vJGNJWFCoUVY=
Subject: [alsa-devel] Reloop Play is recognized and the ouput LED works but
 i get no sound on my headphones
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

hi,

i dont know what will happen to this mail but i'll give it a try anyway.
i got this link after using alsa-info:

http://alsa-project.org/db/?f=56880d275298302ba0a820c34cfc3a143dd3d4cf

im not a total linux freshman but not a developer either. i found some 7
year old quirks for making the reloop play card work but alsa seems to
have changed a lot since then.

sorry if i'm totaly at the wrong place here

cheers

flo

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
